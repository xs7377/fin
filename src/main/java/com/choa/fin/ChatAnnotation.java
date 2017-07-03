package com.choa.fin;

import java.io.IOException;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint(value = "/boradcasting/{clientId}")
public class ChatAnnotation {

   private static final Set<ChatAnnotation> connections = new CopyOnWriteArraySet<ChatAnnotation>();

   private String nickname;
   private Session session;

   @OnOpen
   public void start(@PathParam("clientId") String clientId, Session session) {
      this.nickname = clientId;
      this.session = session;
      System.out.println("1"+clientId);
      System.out.println("2"+clientId);
      connections.add(this);
   }

   @OnClose
   public void end() {
      connections.remove(this);
   }

   @OnMessage
   public void incoming(String message) {
      // Never trust the client
      String filteredMessage = String.format("%s: %s", nickname, message.toString());
      broadcast(filteredMessage);
   }

   @OnError
   public void onError(Throwable t) throws Throwable {
      //log.error("Chat Error: " + t.toString(), t);
   }

   private static void broadcast(String msg) {
      for (ChatAnnotation client : connections) {
         try {
            synchronized (client) {
               //String message = "{clId:'" + client.nickname + "',msg:'" + msg + "'}";
            	//ID>> 
            	String message = msg;
            	
               client.session.getBasicRemote().sendText(filter(message));
               
            }
         } catch (IOException e) {
            connections.remove(client);
            try {
               client.session.close();
            } catch (IOException e1) {
               // Ignore
            }
            String message = String.format("* %s %s", client.nickname, "has been disconnected.");
            broadcast(message);
         }
      }
   }

   private static String filter(String message) {

      if (message == null)
         return (null);

      char content[] = new char[message.length()];
      message.getChars(0, message.length(), content, 0);
      StringBuilder result = new StringBuilder(content.length + 50);
      for (int i = 0; i < content.length; i++) {
         switch (content[i]) {
            case '<':
               result.append("&lt;");
               break;
            case '>':
               result.append("&gt;");
               break;
            case '&':
               result.append("&amp;");
               break;
            case '"':
               result.append("&quot;");
               break;
            default:
               result.append(content[i]);
         }
      }
      return (result.toString());

   }
}
	
	


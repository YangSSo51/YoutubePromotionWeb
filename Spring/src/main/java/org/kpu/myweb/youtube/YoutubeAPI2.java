package org.kpu.myweb.youtube;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.google.api.client.googleapis.json.GoogleJsonResponseException;
import com.google.api.client.http.HttpRequest;
import com.google.api.client.http.HttpRequestInitializer;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.services.youtube.YouTube;
import com.google.api.services.youtube.model.Channel;
import com.google.api.services.youtube.model.ChannelListResponse;
import com.google.api.services.youtube.model.Thumbnail;

public class YoutubeAPI2 {

	  private static String PROPERTIES_FILENAME = "youtube_properties";
	  private static final HttpTransport HTTP_TRANSPORT = new NetHttpTransport();
	  private static final JsonFactory JSON_FACTORY = new JacksonFactory();
	  private static YouTube youtube;

	  // Youtube Channel 정보
	  public List<String> getYoutubeProfile(String channelId) {
	    // Read the developer key from youtube.properties
	    Properties properties = new Properties();
	    List<String> list = new ArrayList<String>();
	    try {
	      InputStream in = YoutubeAPI.class.getResourceAsStream("/" + PROPERTIES_FILENAME);
	      properties.load(in);

	    } catch (IOException e) {
	      System.err.println("There was an error reading " + PROPERTIES_FILENAME + ": " + e.getCause()
	          + " : " + e.getMessage());
	      System.exit(1);
	    }

	    try {
	      youtube = new YouTube.Builder(HTTP_TRANSPORT, JSON_FACTORY, new HttpRequestInitializer() {
	        public void initialize(HttpRequest request) throws IOException {}
	      }).setApplicationName("youtube-cmdline-search-sample").build();

	      String apiKey = properties.getProperty("youtube_apikey");

	      YouTube.Channels.List channelRequest = youtube.channels().list("statistics, snippet");
	      channelRequest.setKey(apiKey);
	      channelRequest.setId(channelId);
	      channelRequest.setFields("items(statistics, snippet)");
	      ChannelListResponse channelResult = channelRequest.execute();
	      
	      List<Channel> channelList = channelResult.getItems();
	      
	      if(channelList != null) {
	    	  System.out.println("size : " + channelList.size());	    	
	    	  Channel channel = channelList.get(0);
	    	  Thumbnail thumbnail = channel.getSnippet().getThumbnails().getMedium();
	    	 
		      System.out.println("\n================== Channel ==================\n");
		      System.out.println("  - ID: " + channel);
		      System.out.println("  - 채널명: " + channel.getSnippet().getTitle());
		      System.out.println("  - 채널 개설일: " + channel.getSnippet().getPublishedAt());
		      System.out.println("  - 구독자 수: " + channel.getStatistics().getSubscriberCount());
		      System.out.println("  - 썸네일 : " + thumbnail.getUrl());
		      System.out.println("\n-------------------------------------------------------------\n");
		      
		      String publishedAt = channel.getSnippet().getPublishedAt().toString();
		      publishedAt = publishedAt.split("T")[0];
		      
		      list.add(channel.getSnippet().getTitle());
		      list.add(publishedAt);
		      list.add(channel.getStatistics().getSubscriberCount().toString());
		      list.add(thumbnail.getUrl());
	      }
	    }
	    catch (GoogleJsonResponseException e) {
	      System.err.println("There was a service error: " + e.getDetails().getCode() + " : "
	          + e.getDetails().getMessage());
	    } catch (IOException e) {
	      System.err.println("There was an IO error: " + e.getCause() + " : " + e.getMessage());
	    } catch (Throwable t) {
	      t.printStackTrace();
	    }
	    
	    return list;
	  }
	  
	  // Youtube Channel 존재 확인
	  public boolean checkChannel(String channelId) {
		  Properties properties = new Properties();
		    try {
		      InputStream in = YoutubeAPI.class.getResourceAsStream("/" + PROPERTIES_FILENAME);
		      properties.load(in);
	
		    } catch (IOException e) {
		      System.err.println("There was an error reading " + PROPERTIES_FILENAME + ": " + e.getCause()
		          + " : " + e.getMessage());
		      System.exit(1);
		    }
	
		    try {
		      youtube = new YouTube.Builder(HTTP_TRANSPORT, JSON_FACTORY, new HttpRequestInitializer() {
		        public void initialize(HttpRequest request) throws IOException {}
		      }).setApplicationName("youtube-cmdline-search-sample").build();
	
		      String apiKey = properties.getProperty("youtube_apikey");
	
		      YouTube.Channels.List channelRequest = youtube.channels().list("statistics, snippet");
		      channelRequest.setKey(apiKey);
		      channelRequest.setId(channelId);
		      channelRequest.setFields("items(id)");
		      ChannelListResponse channelResult = channelRequest.execute();
		      
		      List<Channel> channelList = channelResult.getItems();
		      
		      if(channelList != null) {
		    	  return true;
		      }
		      
		    }catch (GoogleJsonResponseException e) {
		      System.err.println("There was a service error: " + e.getDetails().getCode() + " : "
		          + e.getDetails().getMessage());
		    } catch (IOException e) {
		      System.err.println("There was an IO error: " + e.getCause() + " : " + e.getMessage());
		    } catch (Throwable t) {
		      t.printStackTrace();
		    }
		    
		    return false;
	  }	  
	  
}

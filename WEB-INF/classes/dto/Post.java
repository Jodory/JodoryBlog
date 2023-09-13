package dto;

import java.io.Serializable;

public class Post {
	private static final long seriaVersionUID = -42740057203867700L;
	private String postId;
	private String title;
	private String category;
	private String content;
	private String date;
	private String filename;

	public Post() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getPostId() {
		return postId;
	}

	public void setPostId(String postId) {
		this.postId = postId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public static long getSeriaversionuid() {
		return seriaVersionUID;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

}

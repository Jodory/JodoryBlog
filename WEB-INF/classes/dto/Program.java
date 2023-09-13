package dto;
//완료
import java.io.Serializable;

public class Program {
	private static final long seriaVersionUID = -42740057203867700L;
	private String programId;
	private String name;
	private Integer unitPrice;
	private String releaseDate;
	private String recentUpdate;
	private String producer;
	private String category;
	private String description;
	
	
	private String condition;
	private String filename;
	private int quantity; // 세션 추가

	public Program() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Program(String category, String name) {
		this.category = category;
		this.name = name;
	}

	public String getProgramId() {
		return programId;
	}

	public void setProgramId(String programId) {
		this.programId = programId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Integer unitPrice) {
		this.unitPrice = unitPrice;
	}


	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	
	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}

	public String getCondition() {
		return condition;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public static long getSeriaversionuid() {
		return seriaVersionUID;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public String getRecentUpdate() {
		return recentUpdate;
	}

	public void setRecentUpdate(String recentUpate) {
		this.recentUpdate = recentUpate;
	}

	public String getProducer() {
		return producer;
	}

	public void setProducer(String producer) {
		this.producer = producer;
	}
	

}

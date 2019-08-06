package funding;

public class ItemDTO {
	String item_picture_name = "";
	String item_title = "";
	int item_people = 0;
	int item_money = 0;
	int item_goal_money = 0;
	String item_remain_time = "";
	String item_content = "";
	int item_id = 0;
	String userid = "";
	String item_enroll_date;
	
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getItem_enroll_date() {
		return item_enroll_date;
	}
	public void setItem_enroll_date(String item_enroll_date) {
		this.item_enroll_date = item_enroll_date;
	}
	public String getItem_picture_name() {
		return item_picture_name;
	}
	public void setItem_picture_name(String item_picture_name) {
		this.item_picture_name = item_picture_name;
	}
	public String getItem_title() {
		return item_title;
	}
	public void setItem_title(String item_title) {
		this.item_title = item_title;
	}
	public int getItem_people() {
		return item_people;
	}
	public void setItem_people(int item_people) {
		this.item_people = item_people;
	}
	public int getItem_money() {
		return item_money;
	}
	public void setItem_money(int item_money) {
		this.item_money = item_money;
	}
	public int getItem_goal_money() {
		return item_goal_money;
	}
	public void setItem_goal_money(int item_goal_money) {
		this.item_goal_money = item_goal_money;
	}
	public String getItem_remain_time() {
		return item_remain_time;
	}
	public void setItem_remain_time(String item_remain_time) {
		this.item_remain_time = item_remain_time;
	}
	public String getItem_content() {
		return item_content;
	}
	public void setItem_content(String item_content) {
		this.item_content = item_content;
	}
	public int getItem_id() {
		return item_id;
	}
	public void setItem_id(int item_id) {
		this.item_id = item_id;
	}
}

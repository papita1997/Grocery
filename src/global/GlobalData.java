package global;

import java.util.HashMap;

public class GlobalData {
	public static HashMap<String,String> units;	
	static {
		units = new HashMap<>();
		units.put("u101", "gram");
		units.put("u102", "kilogram");
		units.put("u103", "liter");
	}
}

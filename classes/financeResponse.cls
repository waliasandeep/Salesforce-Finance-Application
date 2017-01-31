global with sharing class financeResponse {
	public List<wrapResponse> lstWrapResp{get;set;}
   
    
   
    global class wrapResponse
    {
		public String id;
		public String t;
		public String e;
		public String l;
		public String l_fix;
		public String l_cur;
		public String s;
		public String ltt;
		public String lt;
		public String lt_dts;
		public String c;
		public String c_fix;
		public String cp;
		public String cp_fix;
		public String ccol;
		public String pcls_fix;
    }

	
	public List<wrapResponse> parsefinanceResponse(String json) {
		return (List<wrapResponse>) System.JSON.deserialize(json, List<wrapResponse>.class);
	}
    
}
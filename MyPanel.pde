/*
public class MyPanel extends JPanel {
    private JTextArea jcomp1;
    private JRadioButton jcomp2;
    private JRadioButton jcomp3;
  //  private JTextField jcomp4;
    private TextDemo jcomp4;
   // private JTextField jcomp5;
   private TextDemo2 jcomp5;
    private JButton jcomp6;

    public MyPanel() {
        //construct components
        jcomp1 = new JTextArea (5, 5);
        
        jcomp2 = new JRadioButton ("Latitude");
        jcomp3 = new JRadioButton ("Longitude");
       // jcomp4 = new JTextField (5);
        jcomp4 = new TextDemo();
       // jcomp5 = new JTextField (5);
        jcomp5 = new TextDemo2();
        jcomp6 = new JButton ("Start");
        jcomp6.addActionListener(new Button6Click());

        //set components properties
        jcomp2.setToolTipText ("Select to Set");
        jcomp3.setToolTipText ("Select to Set");
        jcomp4.setToolTipText ("DD,mmss");
        jcomp5.setToolTipText ("DDD.mmss");
        jcomp6.setToolTipText ("Click to Start");

        //adjust size and set layout
        setPreferredSize (new Dimension (372, 214));
        setLayout (null);

        //add components
        add (jcomp1);
        add (jcomp2);
        add (jcomp3);
        add (jcomp4);
        add (jcomp5);
        add (jcomp6);

        //set component bounds (only needed by Absolute Positioning)
        jcomp1.setBounds (45, 235, 555, 125);
        jcomp2.setBounds (40, 45, 125, 30);
        jcomp3.setBounds (40, 105, 125, 25);
        jcomp4.setBounds (165, 50, 165, 30);  //
        jcomp5.setBounds (165, 100, 165, 30); //
        jcomp6.setBounds (50, 165, 100, 25);
    }  */
    public class MyPanel extends JPanel {
    private TextDemo3 jcomp1; //JTextField jcomp1;
    private TextDemo jcomp2; //JTextField jcomp2;
    private TextDemo2 jcomp3; //JTextField jcomp3;
    private JLabel jcomp4;
    private JLabel jcomp5;
    private JLabel jcomp6;
    private JButton jcomp7;
    
    private JButton jcomp8;
    private JButton jcomp9;
    private JButton jcomp10;

    public MyPanel() {
        //construct components
        jcomp1 = new TextDemo3(); //JTextField (5);
        jcomp2 =   new TextDemo(); //JTextField (5);
        jcomp3 = new TextDemo2(); // JTextField (5);
        jcomp4 = new JLabel ("TimeZone(+/- hours)");
        jcomp5 = new JLabel (" Latitude(+/- DD,mmss)");
        jcomp6 = new JLabel ("Longitude(+/-  DDD.mmss)");
        jcomp7 = new JButton ("Start");
        jcomp7.addActionListener(new Button6Click());
        jcomp8 = new JButton ("Star1");
        jcomp8.addActionListener(new Button5Click());
        jcomp9 = new JButton ("Star2");
        jcomp9.addActionListener(new Button4Click());
        jcomp10 = new JButton ("Star3");
        jcomp10.addActionListener(new Button3Click());
        

        //set components properties
        jcomp1.setToolTipText ("hit return to enter");
        jcomp2.setToolTipText ("Hit return to enter");
        jcomp3.setToolTipText ("hit return to enter");
        jcomp7.setToolTipText ("click to run");

        //adjust size and set layout
        setPreferredSize (new Dimension (449,300 )); //265));
        setLayout (null);

        //add components
        add (jcomp1);
        add (jcomp2);
        add (jcomp3);
        add (jcomp4);
        add (jcomp5);
        add (jcomp6);
        add (jcomp7);
        
        add(jcomp8);
        add(jcomp9);
        add(jcomp10);

        //set component bounds (only needed by Absolute Positioning)
        jcomp1.setBounds (200, 35, 225, 25); //
        jcomp2.setBounds (200, 80, 225, 23); //
        jcomp3.setBounds (200, 124, 225, 23); //
        jcomp4.setBounds (10, 25, 175, 35);
        jcomp5.setBounds (5, 75, 170, 35);
        jcomp6.setBounds (5, 125, 190, 30);
        jcomp7.setBounds (65, 185, 100, 25);
        
        jcomp8.setBounds (65, 230, 100, 25);
        jcomp9.setBounds (200, 230, 100, 25);
        jcomp10.setBounds (330, 230, 100, 25);
      /* jcomp1.setBounds (200, 20, 225, 35);
        jcomp2.setBounds (200, 70, 225, 35);
        jcomp3.setBounds (200, 120, 225, 35);
        jcomp4.setBounds (10, 25, 175, 35);
        jcomp5.setBounds (5, 75, 170, 35);
        jcomp6.setBounds (5, 125, 190, 30);
        jcomp7.setBounds (65, 185, 100, 25);
        
                jcomp1.setBounds (45, 235, 555, 125);
        jcomp2.setBounds (40, 45, 125, 30);
        jcomp3.setBounds (40, 105, 125, 25);
        jcomp4.setBounds (165, 50, 165, 30);  //
        jcomp5.setBounds (165, 100, 165, 30); //
        jcomp6.setBounds (50, 165, 100, 25);
        
        */
    }
}





public class TextDemo extends JPanel implements ActionListener {
    protected JTextField textField;
    protected JTextArea textArea;
    private final static String newline = "\n";

    public TextDemo() {
     //   super(new GridBagLayout());
    // textField = new JTextField(HSlider1Change.getValue(),20):
//
   textField = new JTextField((Double.toString((Lat))),20);
  
            //    textField = new JTextField(text,20);
        textField.addActionListener(this);

        textField.requestFocus();
  textField.setHorizontalAlignment(textField.CENTER);
        textArea = new JTextArea(2, 20);
        textArea.setEditable(true);

        add(textField);
 
        add(textArea);
    }
 
    public void actionPerformed(ActionEvent evt) {
        //  public void stateChanged(ChangeEvent evt){   //(ActionEvent evt) {

   textField.requestFocus();
text = textField.getText();
        textArea.append(text + newline);
        textField.selectAll();

       Lat = Double.parseDouble(text);
       textField.setText(Double.toString(Lat));
      // GHA = Math.toRadians(-GHA);
println((Lat));


        //Make sure the new text is visible, even if there
        //was a selection in the text area.
        textArea.setCaretPosition(textArea.getDocument().getLength());
    }  
}




public class TextDemo2 extends JPanel implements ActionListener {
    protected JTextField textField;
    protected JTextArea textArea;
    private final static String newline = "\n";





 
    public TextDemo2() {
     //   super(new GridBagLayout());
    // textField = new JTextField(HSlider1Change.getValue(),20):
//
   textField = new JTextField((Double.toString((Lon))),20);
  
            //    textField = new JTextField(text,20);
        textField.addActionListener(this);

        textField.requestFocus();
  textField.setHorizontalAlignment(textField.CENTER);
        textArea = new JTextArea(2, 20);
        textArea.setEditable(true);

        add(textField);
 
        add(textArea);
    }
 
    public void actionPerformed(ActionEvent evt) {
        //  public void stateChanged(ChangeEvent evt){   //(ActionEvent evt) {

   textField.requestFocus();
text = textField.getText();
        textArea.append(text + newline);
        textField.selectAll();

       Lon = Double.parseDouble(text);
       textField.setText(Double.toString(Lon));
      // GHA = Math.toRadians(-GHA);
     // if (Lon < 0) Lon = -1 * Lon;
     Lon = -1 * Lon;
println((Lon));


        //Make sure the new text is visible, even if there
        //was a selection in the text area.
        textArea.setCaretPosition(textArea.getDocument().getLength());
    }  
}


public class TextDemo3 extends JPanel implements ActionListener {
    protected JTextField textField;
    protected JTextArea textArea;
    private final static String newline = "\n";
 
    public TextDemo3() {
     //   super(new GridBagLayout());
    // textField = new JTextField(HSlider1Change.getValue(),20):
//
   textField = new JTextField((Integer.toString((Zone))),20);
  
            //    textField = new JTextField(text,20);
        textField.addActionListener(this);

        textField.requestFocus();
  textField.setHorizontalAlignment(textField.CENTER);
        textArea = new JTextArea(2, 20);
        textArea.setEditable(true);

        add(textField);
 
        add(textArea);
    }
 
    public void actionPerformed(ActionEvent evt) {
        //  public void stateChanged(ChangeEvent evt){   //(ActionEvent evt) {

   textField.requestFocus();
text = textField.getText();
        textArea.append(text + newline);
        textField.selectAll();

      // Lon = Double.parseDouble(text);
      Zone = Integer.parseInt(text);
       textField.setText(Integer.toString(Zone));
       Zone = Integer.parseInt(text);
      // GHA = Math.toRadians(-GHA);
     // if (Lon < 0) Lon = -1 * Lon;
    /// Zone = -1 * Zone;
   //  if (Zone < 4)
    // Zone = -1 * Zone;
   //  Zone = Zone - 2;
   if (Zone < 0){
   Zone = -1 * Zone;
   if (Zone > 4) {
   Zone = Zone - 1; 
   }
   }
println((Zone));


        //Make sure the new text is visible, even if there
        //was a selection in the text area.
        textArea.setCaretPosition(textArea.getDocument().getLength());
    }  
}





class Button6Click implements ActionListener
{
  public void actionPerformed(ActionEvent e)
  {
 //   JButton b = (JButton)e.getSource();
  //  timer=millis()+1000;
  //  Map = true;
   // Globe = false;
  // GHA3 = GHA;
 //  dec3 = dec;
 //  alt3 = alt;
 //  Star3 = true;


released = true;
initStars();
//released = false;
calculateTable();





  }
}


class Button5Click implements ActionListener
{
  public void actionPerformed(ActionEvent e)
  {
    JButton b = (JButton)e.getSource();
  //  timer=millis()+1000;
  //  Map = true;
   // Globe = false;
   GHA1 = GHA;
   dec1 = dec;
   alt1 = alt;
   Star_1 = true;


released = true;
//initStars();
//released = false;
//calculateTable();





  }
}

class Button4Click implements ActionListener
{
  public void actionPerformed(ActionEvent e)
  {
    JButton b = (JButton)e.getSource();
  //  timer=millis()+1000;
  //  Map = true;
   // Globe = false;
   GHA2 = GHA;
   dec2 = dec;
   alt3 = alt;
   Star_2 = true;


released = true;
//initStars();
//released = false;
//calculateTable();





  }
}


class Button3Click implements ActionListener
{
  public void actionPerformed(ActionEvent e)
  {
 //   JButton b = (JButton)e.getSource();
  //  timer=millis()+1000;
  //  Map = true;
   // Globe = false;
   GHA3 = GHA;
   dec3 = dec;
   alt3 = alt;
   Star_3 = true;


released = true;
//initStars();
//released = false;
//calculateTable();





  }
}

FasdUAS 1.101.10   ��   ��    k             l     ��  ��      Date: June 23, 2024     � 	 	 (   D a t e :   J u n e   2 3 ,   2 0 2 4   
  
 l     ��  ��    !  File Name: Moving Memories     �   6   F i l e   N a m e :   M o v i n g   M e m o r i e s      l     ��  ��      Developed in AppleScript     �   2   D e v e l o p e d   i n   A p p l e S c r i p t      l     ��  ��      Version: 1.0     �      V e r s i o n :   1 . 0      l     ��  ��    2 , Made with Love by TuxesCreations and Aurora     �   X   M a d e   w i t h   L o v e   b y   T u x e s C r e a t i o n s   a n d   A u r o r a      l     ��   !��     f ` Usage: This script recursively processes a source folder, moving files to a destination folder.    ! � " " �   U s a g e :   T h i s   s c r i p t   r e c u r s i v e l y   p r o c e s s e s   a   s o u r c e   f o l d e r ,   m o v i n g   f i l e s   t o   a   d e s t i n a t i o n   f o l d e r .   # $ # l     �� % &��   % b \ It appends the parent folder name and a random suffix to the filenames to avoid duplicates.    & � ' ' �   I t   a p p e n d s   t h e   p a r e n t   f o l d e r   n a m e   a n d   a   r a n d o m   s u f f i x   t o   t h e   f i l e n a m e s   t o   a v o i d   d u p l i c a t e s . $  ( ) ( l     �� * +��   * = 7 JSON files are deleted, and empty folders are removed.    + � , , n   J S O N   f i l e s   a r e   d e l e t e d ,   a n d   e m p t y   f o l d e r s   a r e   r e m o v e d . )  - . - l     �� / 0��   / ( " Contact: hello@tuxescreations.com    0 � 1 1 D   C o n t a c t :   h e l l o @ t u x e s c r e a t i o n s . c o m .  2 3 2 l     �� 4 5��   4 = 7 Dependencies: OpenSSL (for generating random suffixes)    5 � 6 6 n   D e p e n d e n c i e s :   O p e n S S L   ( f o r   g e n e r a t i n g   r a n d o m   s u f f i x e s ) 3  7 8 7 l     ��������  ��  ��   8  9 : 9 l     ��������  ��  ��   :  ; < ; l     �� = >��   =   Set debug flags    > � ? ?     S e t   d e b u g   f l a g s <  @ A @ l      B C D B j     �� E�� "0 dialogdebugflag dialogDebugFlag E m     ��
�� boovfals C , & Change this to true to enable dialogs    D � F F L   C h a n g e   t h i s   t o   t r u e   t o   e n a b l e   d i a l o g s A  G H G l      I J K I j    �� L�� 0 logdebugflag logDebugFlag L m    ��
�� boovfals J , & Change this to true to enable logging    K � M M L   C h a n g e   t h i s   t o   t r u e   t o   e n a b l e   l o g g i n g H  N O N l     ��������  ��  ��   O  P Q P l     �� R S��   R + % Function to generate a random suffix    S � T T J   F u n c t i o n   t o   g e n e r a t e   a   r a n d o m   s u f f i x Q  U V U l     �� W X��   W c ] This function uses the `openssl` command to generate a random 8-character hexadecimal string    X � Y Y �   T h i s   f u n c t i o n   u s e s   t h e   ` o p e n s s l `   c o m m a n d   t o   g e n e r a t e   a   r a n d o m   8 - c h a r a c t e r   h e x a d e c i m a l   s t r i n g V  Z [ Z i    	 \ ] \ I      �������� ,0 generaterandomsuffix generateRandomSuffix��  ��   ] k     
 ^ ^  _ ` _ r      a b a I    �� c��
�� .sysoexecTEXT���     TEXT c m      d d � e e & o p e n s s l   r a n d   - h e x   4��   b o      ���� 0 randomsuffix randomSuffix `  f�� f L    
 g g o    	���� 0 randomsuffix randomSuffix��   [  h i h l     ��������  ��  ��   i  j k j l     �� l m��   l 3 - Function to write log messages to a log file    m � n n Z   F u n c t i o n   t o   w r i t e   l o g   m e s s a g e s   t o   a   l o g   f i l e k  o p o l     �� q r��   q Q K This function logs messages to a file on the desktop if logging is enabled    r � s s �   T h i s   f u n c t i o n   l o g s   m e s s a g e s   t o   a   f i l e   o n   t h e   d e s k t o p   i f   l o g g i n g   i s   e n a b l e d p  t u t i   
  v w v I      �� x���� 0 writelog writeLog x  y�� y o      ���� 0 
logmessage 
logMessage��  ��   w Z     e z {���� z =     | } | o     ���� 0 logdebugflag logDebugFlag } m    ��
�� boovtrue { k   
 a ~ ~   �  r   
  � � � l  
  ����� � b   
  � � � l  
  ����� � I  
 �� � �
�� .earsffdralis        afdr � m   
 ��
�� afdrdesk � �� ���
�� 
rtyp � m    ��
�� 
ctxt��  ��  ��   � m     � � � � � . f i l e _ p r o c e s s i n g _ l o g . t x t��  ��   � o      ���� 0 logfile logFile �  � � � r     � � � c     � � � l    ����� � I   ������
�� .misccurdldt    ��� null��  ��  ��  ��   � m    ��
�� 
TEXT � o      ���� "0 currentdatetime currentDateTime �  � � � r     ) � � � b     ' � � � b     % � � � b     # � � � o     !���� "0 currentdatetime currentDateTime � m   ! " � � � � �    -   � o   # $���� 0 
logmessage 
logMessage � o   % &��
�� 
ret  � o      ���� 0 
logmessage 
logMessage �  ��� � Q   * a � � � � I  - >�� ���
�� .sysoexecTEXT���     TEXT � b   - : � � � b   - 4 � � � b   - 2 � � � m   - . � � � � � 
 e c h o   � n   . 1 � � � 1   / 1��
�� 
strq � o   . /���� 0 
logmessage 
logMessage � m   2 3 � � � � �    > >   � n   4 9 � � � 1   7 9��
�� 
strq � n   4 7 � � � 1   5 7��
�� 
psxp � o   4 5���� 0 logfile logFile��   � R      �� � �
�� .ascrerr ****      � **** � o      ���� 0 errmsg errMsg � �� ���
�� 
errn � o      ���� 0 errnum errNum��   � I  F a�� � �
�� .sysodisAaleR        TEXT � b   F M � � � b   F K � � � m   F I � � � � � $ E r r o r   w r i t i n g   l o g : � o   I J��
�� 
ret  � o   K L���� 0 errmsg errMsg � �� � �
�� 
mesS � b   P U � � � m   P S � � � � �  E r r o r   N u m b e r :   � o   S T���� 0 errnum errNum � �� ���
�� 
as A � m   X [��
�� EAlTwarN��  ��  ��  ��   u  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � = 7 Function to recursively process folders and move files    � � � � n   F u n c t i o n   t o   r e c u r s i v e l y   p r o c e s s   f o l d e r s   a n d   m o v e   f i l e s �  � � � l     �� � ���   � w q This function handles the main logic for processing the source folder and moving files to the destination folder    � � � � �   T h i s   f u n c t i o n   h a n d l e s   t h e   m a i n   l o g i c   f o r   p r o c e s s i n g   t h e   s o u r c e   f o l d e r   a n d   m o v i n g   f i l e s   t o   t h e   d e s t i n a t i o n   f o l d e r �  � � � i     � � � I      �� ����� 0 processfolder processFolder �  � � � o      ���� 0 sourcefolder sourceFolder �  � � � o      ���� &0 destinationfolder destinationFolder �  � � � o      ���� 0 filecountref fileCountRef �  � � � o      ���� 0 movedcountref movedCountRef �  ��� � o      ���� 0 jsoncountref jsonCountRef��  ��   � k      � �  � � � O     � � � Q    � � � � k   � � �  � � � l   �� � ���   � ( " Check if the source folder exists    � � � � D   C h e c k   i f   t h e   s o u r c e   f o l d e r   e x i s t s �  � � � Z   � � ����� � I   �� ���
�� .coredoexnull���     obj  � o    ���� 0 sourcefolder sourceFolder��   � k   � � �  � � � r     � � � n     � � � 2    ��
�� 
cobj � o    ���� 0 sourcefolder sourceFolder � o      ���� 0 sourceitems sourceItems �  � � � n    � � � I    �� ����� 0 writelog writeLog �  ��� � b       m     � & P r o c e s s i n g   f o l d e r :   l   ���� c     o    ���� 0 sourcefolder sourceFolder m    ��
�� 
ctxt��  ��  ��  ��   �  f     �  l     ��������  ��  ��   	
	 l     ����   5 / Iterate through each item in the source folder    � ^   I t e r a t e   t h r o u g h   e a c h   i t e m   i n   t h e   s o u r c e   f o l d e r
  X    ��� Z   0��� =  0 5 n   0 3 m   1 3��
�� 
pcls o   0 1���� 0 
sourceitem 
sourceItem m   3 4��
�� 
cfol k   8 �  l  8 8��   6 0 If the item is a folder, process it recursively    � `   I f   t h e   i t e m   i s   a   f o l d e r ,   p r o c e s s   i t   r e c u r s i v e l y   r   8 Z!"! n  8 D#$# I   9 D�~%�}�~ 0 processfolder processFolder% &'& c   9 <()( o   9 :�|�| 0 
sourceitem 
sourceItem) m   : ;�{
�{ 
alis' *+* o   < =�z�z &0 destinationfolder destinationFolder+ ,-, o   = >�y�y 0 filecountref fileCountRef- ./. o   > ?�x�x 0 movedcountref movedCountRef/ 0�w0 o   ? @�v�v 0 jsoncountref jsonCountRef�w  �}  $  f   8 9" J      11 232 o      �u�u 0 filecountref fileCountRef3 454 o      �t�t 0 movedcountref movedCountRef5 6�s6 o      �r�r 0 jsoncountref jsonCountRef�s    787 l  [ [�q�p�o�q  �p  �o  8 9:9 l  [ [�n;<�n  ; = 7 Check if the subfolder is empty and delete it if it is   < �== n   C h e c k   i f   t h e   s u b f o l d e r   i s   e m p t y   a n d   d e l e t e   i t   i f   i t   i s: >�m> Z   [ �?@�l�k? I  [ `�jA�i
�j .coredoexnull���     obj A o   [ \�h�h 0 
sourceitem 
sourceItem�i  @ k   c �BB CDC r   c hEFE n   c fGHG 2   d f�g
�g 
cobjH o   c d�f�f 0 
sourceitem 
sourceItemF o      �e�e 0 subitems subItemsD I�dI Z   i �JK�c�bJ =  i pLML l  i nN�a�`N I  i n�_O�^
�_ .corecnte****       ****O o   i j�]�] 0 subitems subItems�^  �a  �`  M m   n o�\�\  K k   s �PP QRQ I  s x�[S�Z
�[ .coredelonull���     obj S o   s t�Y�Y 0 
sourceitem 
sourceItem�Z  R T�XT n  y �UVU I   z ��WW�V�W 0 writelog writeLogW X�UX b   z YZY m   z {[[ �\\ , D e l e t e d   e m p t y   f o l d e r :  Z l  { ~]�T�S] c   { ~^_^ o   { |�R�R 0 
sourceitem 
sourceItem_ m   | }�Q
�Q 
ctxt�T  �S  �U  �V  V  f   y z�X  �c  �b  �d  �l  �k  �m   `a` =  � �bcb n   � �ded m   � ��P
�P 
pclse o   � ��O�O 0 
sourceitem 
sourceItemc m   � ��N
�N 
docfa f�Mf k   ��gg hih l  � ��Ljk�L  j 1 + If the item is a document file, process it   k �ll V   I f   t h e   i t e m   i s   a   d o c u m e n t   f i l e ,   p r o c e s s   i ti mnm l  � ��K�J�I�K  �J  �I  n opo l  � ��Hqr�H  q   Increment the file count   r �ss 2   I n c r e m e n t   t h e   f i l e   c o u n tp tut r   � �vwv [   � �xyx l  � �z�G�Fz n   � �{|{ 4   � ��E}
�E 
cobj} m   � ��D�D | o   � ��C�C 0 filecountref fileCountRef�G  �F  y m   � ��B�B w n      ~~ 4   � ��A�
�A 
cobj� m   � ��@�@  o   � ��?�? 0 filecountref fileCountRefu ��� l  � ��>�=�<�>  �=  �<  � ��� l  � ��;���;  � &   Get the file name and extension   � ��� @   G e t   t h e   f i l e   n a m e   a n d   e x t e n s i o n� ��� r   � ���� n   � ���� 1   � ��:
�: 
pnam� o   � ��9�9 0 
sourceitem 
sourceItem� o      �8�8 0 filename fileName� ��� r   � ���� n   � ���� 1   � ��7
�7 
nmxt� o   � ��6�6 0 
sourceitem 
sourceItem� o      �5�5 0 fileextension fileExtension� ��� l  � ��4�3�2�4  �3  �2  � ��� l  � ��1���1  � !  Get the parent folder name   � ��� 6   G e t   t h e   p a r e n t   f o l d e r   n a m e� ��� r   � ���� n   � ���� 1   � ��0
�0 
pnam� n   � ���� m   � ��/
�/ 
ctnr� o   � ��.�. 0 
sourceitem 
sourceItem� o      �-�- $0 parentfoldername parentFolderName� ��� l  � ��,�+�*�,  �+  �*  � ��� l  � ��)���)  � 4 . Define baseName to exclude the file extension   � ��� \   D e f i n e   b a s e N a m e   t o   e x c l u d e   t h e   f i l e   e x t e n s i o n� ��� r   � ���� n   � ���� 7  � ��(��
�( 
ctxt� m   � ��'�' � l  � ���&�%� \   � ���� l  � ���$�#� I  � ��"�!�
�" .sysooffslong    ��� null�!  � � ��
�  
psof� b   � ���� m   � ��� ���  .� o   � ��� 0 fileextension fileExtension� ���
� 
psin� o   � ��� 0 filename fileName�  �$  �#  � m   � ��� �&  �%  � o   � ��� 0 filename fileName� o      �� 0 basename baseName� ��� l  � �����  �  �  � ��� l  � �����  � ? 9 Check if the file is a .json file and delete it if it is   � ��� r   C h e c k   i f   t h e   f i l e   i s   a   . j s o n   f i l e   a n d   d e l e t e   i t   i f   i t   i s� ��� Z   ������� =  � ���� o   � ��� 0 fileextension fileExtension� m   � ��� ���  j s o n� k   ��� ��� l  � �����  � $  Increment the JSON file count   � ��� <   I n c r e m e n t   t h e   J S O N   f i l e   c o u n t� ��� r   � ���� [   � ���� l  � ����� n   � ���� 4   � ���
� 
cobj� m   � ��� � o   � ��� 0 jsoncountref jsonCountRef�  �  � m   � ��� � n      ��� 4   � ��
�
�
 
cobj� m   � ��	�	 � o   � ��� 0 jsoncountref jsonCountRef� ��� I  � ����
� .coredelonull���     obj � o   � ��� 0 
sourceitem 
sourceItem�  � ��� n  ���� I   ����� 0 writelog writeLog� ��� b   � ��� m   � ��� ��� & D e l e t e d   J S O N   f i l e :  � o   � �� �  0 filename fileName�  �  �  f   � ��  �  � k  ��� ��� l ������  � * $ Construct the destination file path   � ��� H   C o n s t r u c t   t h e   d e s t i n a t i o n   f i l e   p a t h� ��� r  ��� l ������ b  ��� l 
������ c  
��� o  ���� &0 destinationfolder destinationFolder� m  	��
�� 
ctxt��  ��  � o  
���� 0 filename fileName��  ��  � o      ���� *0 destinationfilepath destinationFilePath� ��� Q  '�� � k    r   4  ��
�� 
alis o  ���� *0 destinationfilepath destinationFilePath o      ���� $0 destinationalias destinationAlias �� r  	 m  ��
�� boovtrue	 o      ���� 0 
fileexists 
fileExists��  � R      ������
�� .ascrerr ****      � ****��  ��    r  $'

 m  $%��
�� boovfals o      ���� 0 
fileexists 
fileExists�  l ((��������  ��  ��    l ((����   J D Check if a file with the same name exists in the destination folder    � �   C h e c k   i f   a   f i l e   w i t h   t h e   s a m e   n a m e   e x i s t s   i n   t h e   d e s t i n a t i o n   f o l d e r �� Z  (��� o  ()���� 0 
fileexists 
fileExists k  ,�  l ,,����   5 / Generate a random suffix for the new file name    � ^   G e n e r a t e   a   r a n d o m   s u f f i x   f o r   t h e   n e w   f i l e   n a m e  r  ,3  n ,1!"! I  -1�������� ,0 generaterandomsuffix generateRandomSuffix��  ��  "  f  ,-  o      ���� 0 randomsuffix randomSuffix #$# l 44��������  ��  ��  $ %&% l 44��'(��  ' L F Construct the new file name with parent folder name and random suffix   ( �)) �   C o n s t r u c t   t h e   n e w   f i l e   n a m e   w i t h   p a r e n t   f o l d e r   n a m e   a n d   r a n d o m   s u f f i x& *+* r  4K,-, b  4G./. b  4E010 b  4A232 b  4?454 b  4;676 b  49898 o  45���� 0 basename baseName9 m  58:: �;;  _7 o  9:���� $0 parentfoldername parentFolderName5 m  ;><< �==  _3 o  ?@���� 0 randomsuffix randomSuffix1 m  AD>> �??  ./ o  EF���� 0 fileextension fileExtension- o      ���� 0 newname newName+ @A@ l LL��������  ��  ��  A BCB l LL��DE��  D   Rename the file   E �FF     R e n a m e   t h e   f i l eC GHG r  LUIJI o  LO���� 0 newname newNameJ n      KLK 1  PT��
�� 
pnamL o  OP���� 0 
sourceitem 
sourceItemH MNM n VhOPO I  Wh��Q���� 0 writelog writeLogQ R��R b  WdSTS b  W`UVU b  W\WXW m  WZYY �ZZ  R e n a m e d   f i l e :  X o  Z[���� 0 filename fileNameV m  \_[[ �\\    t o  T o  `c���� 0 newname newName��  ��  P  f  VWN ]^] l ii��������  ��  ��  ^ _`_ l ii��ab��  a 6 0 Move the renamed file to the destination folder   b �cc `   M o v e   t h e   r e n a m e d   f i l e   t o   t h e   d e s t i n a t i o n   f o l d e r` ded r  i|fgf l ixh����h b  ixiji b  itklk n  ipmnm 1  lp��
�� 
psxpn l ilo����o c  ilpqp o  ij���� 0 sourcefolder sourceFolderq m  jk��
�� 
alis��  ��  l m  psrr �ss  /j o  tw���� 0 newname newName��  ��  g o      ���� 0 newfilepath newFilePathe tut r  }�vwv c  }�xyx 4  }���z
�� 
psxfz o  ������ 0 newfilepath newFilePathy m  ����
�� 
alisw o      ���� 0 newfilealias newFileAliasu {|{ I ����}~
�� .coremovenull���     obj } o  ������ 0 newfilealias newFileAlias~ ����
�� 
insh o  ������ &0 destinationfolder destinationFolder��  | ��� n ����� I  ��������� 0 writelog writeLog� ���� b  ����� b  ����� b  ����� m  ���� ��� ( M o v e d   r e n a m e d   f i l e :  � o  ������ 0 newname newName� m  ���� ���    t o  � l �������� c  ����� o  ������ &0 destinationfolder destinationFolder� m  ����
�� 
ctxt��  ��  ��  ��  �  f  ��� ��� l ����������  ��  ��  � ��� l ��������  � %  Increment the moved file count   � ��� >   I n c r e m e n t   t h e   m o v e d   f i l e   c o u n t� ��� r  ����� [  ����� l �������� n  ����� 4  �����
�� 
cobj� m  ������ � o  ������ 0 movedcountref movedCountRef��  ��  � m  ������ � n      ��� 4  �����
�� 
cobj� m  ������ � o  ������ 0 movedcountref movedCountRef� ��� l ����������  ��  ��  � ��� l ��������  � 7 1 Display a dialog if the dialog debug flag is set   � ��� b   D i s p l a y   a   d i a l o g   i f   t h e   d i a l o g   d e b u g   f l a g   i s   s e t� ���� Z  ��������� = ����� o  ������ "0 dialogdebugflag dialogDebugFlag� m  ����
�� boovtrue� I ������
�� .sysodlogaskr        TEXT� b  ����� b  ����� b  ����� b  ����� m  ���� ���  F i l e   '� o  ������ 0 filename fileName� m  ���� ���  '   r e n a m e d   t o   '� o  ������ 0 newname newName� m  ���� ��� d '   a n d   m o v e d   d u e   t o   d u p l i c a t e   f o u n d   i n   d e s t i n a t i o n .� ����
�� 
btns� J  ���� ���� m  ���� ���  O K��  � ����
�� 
dflt� m  ���� ���  O K� �����
�� 
disp� m  ����
�� stic   ��  ��  ��  ��  ��   k  ���� ��� l ��������  � L F Append the parent folder name to the file name if no duplicate exists   � ��� �   A p p e n d   t h e   p a r e n t   f o l d e r   n a m e   t o   t h e   f i l e   n a m e   i f   n o   d u p l i c a t e   e x i s t s� ��� r  ���� b  ���� b  � ��� b  ����� b  ����� o  ������ 0 basename baseName� m  ���� ���  _� o  ������ $0 parentfoldername parentFolderName� m  ���� ���  .� o   ���� 0 fileextension fileExtension� o      ���� 0 newname newName� ��� r  ��� o  
���� 0 newname newName� n      ��� 1  ��
�� 
pnam� o  
���� 0 
sourceitem 
sourceItem� ��� l ��������  ��  ��  � ��� l ������  � @ : Move the file with the new name to the destination folder   � ��� t   M o v e   t h e   f i l e   w i t h   t h e   n e w   n a m e   t o   t h e   d e s t i n a t i o n   f o l d e r� ��� r  $��� l  ������ b   ��� b  ��� n  ��� 1  �
� 
psxp� l ��~�}� c  ��� o  �|�| 0 sourcefolder sourceFolder� m  �{
�{ 
alis�~  �}  � m  �� �    /� o  �z�z 0 newname newName��  ��  � o      �y�y 0 newfilepath newFilePath�  r  %3 c  %/ 4  %-�x
�x 
psxf o  ),�w�w 0 newfilepath newFilePath m  -.�v
�v 
alis o      �u�u 0 newfilealias newFileAlias 	 I 4?�t

�t .coremovenull���     obj 
 o  47�s�s 0 newfilealias newFileAlias �r�q
�r 
insh o  :;�p�p &0 destinationfolder destinationFolder�q  	  n @T I  AT�o�n�o 0 writelog writeLog �m b  AP b  AL b  AH m  AD �  M o v e d   f i l e :   o  DG�l�l 0 newname newName m  HK �    t o   l LO�k�j c  LO o  LM�i�i &0 destinationfolder destinationFolder m  MN�h
�h 
ctxt�k  �j  �m  �n    f  @A  !  l UU�g�f�e�g  �f  �e  ! "#" l UU�d$%�d  $ %  Increment the moved file count   % �&& >   I n c r e m e n t   t h e   m o v e d   f i l e   c o u n t# '(' r  U`)*) [  U[+,+ l UY-�c�b- n  UY./. 4  VY�a0
�a 
cobj0 m  WX�`�` / o  UV�_�_ 0 movedcountref movedCountRef�c  �b  , m  YZ�^�^ * n      121 4  \_�]3
�] 
cobj3 m  ]^�\�\ 2 o  [\�[�[ 0 movedcountref movedCountRef( 454 l aa�Z�Y�X�Z  �Y  �X  5 676 l aa�W89�W  8 7 1 Display a dialog if the dialog debug flag is set   9 �:: b   D i s p l a y   a   d i a l o g   i f   t h e   d i a l o g   d e b u g   f l a g   i s   s e t7 ;�V; Z  a�<=�U�T< = ah>?> o  af�S�S "0 dialogdebugflag dialogDebugFlag? m  fg�R
�R boovtrue= I k��Q@A
�Q .sysodlogaskr        TEXT@ b  kvBCB b  krDED m  knFF �GG  F i l e   'E o  nq�P�P 0 newname newNameC m  ruHH �II 2 '   m o v e d   w i t h o u t   r e n a m i n g .A �OJK
�O 
btnsJ J  y~LL M�NM m  y|NN �OO  O K�N  K �MPQ
�M 
dfltP m  ��RR �SS  O KQ �LT�K
�L 
dispT m  ���J
�J stic   �K  �U  �T  �V  ��  �  �M  ��  �� 0 
sourceitem 
sourceItem o   # $�I�I 0 sourceitems sourceItems UVU l ���H�G�F�H  �G  �F  V WXW l ���EYZ�E  Y ] W After processing all items, check if the source folder is empty and delete it if it is   Z �[[ �   A f t e r   p r o c e s s i n g   a l l   i t e m s ,   c h e c k   i f   t h e   s o u r c e   f o l d e r   i s   e m p t y   a n d   d e l e t e   i t   i f   i t   i sX \�D\ Z  ��]^�C�B] I ���A_�@
�A .coredoexnull���     obj _ o  ���?�? 0 sourcefolder sourceFolder�@  ^ k  ��`` aba r  ��cdc n  ��efe 2  ���>
�> 
cobjf o  ���=�= 0 sourcefolder sourceFolderd o      �<�<  0 remainingitems remainingItemsb g�;g Z  ��hi�:�9h = ��jkj l ��l�8�7l I ���6m�5
�6 .corecnte****       ****m o  ���4�4  0 remainingitems remainingItems�5  �8  �7  k m  ���3�3  i k  ��nn opo I ���2q�1
�2 .coredelonull���     obj q o  ���0�0 0 sourcefolder sourceFolder�1  p r�/r n ��sts I  ���.u�-�. 0 writelog writeLogu v�,v b  ��wxw m  ��yy �zz : D e l e t e d   e m p t y   s o u r c e   f o l d e r :  x l ��{�+�*{ c  ��|}| o  ���)�) 0 sourcefolder sourceFolder} m  ���(
�( 
ctxt�+  �*  �,  �-  t  f  ���/  �:  �9  �;  �C  �B  �D  ��  ��   � ~�'~ l ���&�%�$�&  �%  �$  �'   � R      �#�
�# .ascrerr ****      � **** o      �"�" 0 errmsg errMsg� �!�� 
�! 
errn� o      �� 0 errnum errNum�    � k  ��� ��� l ������  � X R Log and display an error message if something goes wrong during folder processing   � ��� �   L o g   a n d   d i s p l a y   a n   e r r o r   m e s s a g e   i f   s o m e t h i n g   g o e s   w r o n g   d u r i n g   f o l d e r   p r o c e s s i n g� ��� n ����� I  ������ 0 writelog writeLog� ��� b  ����� b  ����� b  ����� m  ���� ��� 2 E r r o r   p r o c e s s i n g   f o l d e r :  � l ������ c  ����� o  ���� 0 sourcefolder sourceFolder� m  ���
� 
ctxt�  �  � m  ���� ���    -  � o  ���� 0 errmsg errMsg�  �  �  f  ��� ��� I ����
� .sysodisAaleR        TEXT� b  ���� b  ����� m  ���� ��� 0 E r r o r   p r o c e s s i n g   f o l d e r :� o  ���
� 
ret � o  ��� 0 errmsg errMsg� ���
� 
mesS� b  ��� m  �� ���  E r r o r   N u m b e r :  � o  �� 0 errnum errNum� ���
� 
as A� m  �
� EAlTwarN�  �   � m     ���                                                                                  MACS  alis    @  Macintosh HD               ��BD ����
Finder.app                                                     ������        ����  
 cu             CoreServices  )/:System:Library:CoreServices:Finder.app/    
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��   � ��� L   �� J  �� ��� o  �� 0 filecountref fileCountRef� ��� o  �
�
 0 movedcountref movedCountRef� ��	� o  �� 0 jsoncountref jsonCountRef�	  �   � ��� l     ����  �  �  � ��� l     ����  �   Main script logic   � ��� $   M a i n   s c r i p t   l o g i c� ��� l   ���� O    ��� Q   
���� k    ��� ��� l   � ���   � C = Prompt the user to choose the source and destination folders   � ��� z   P r o m p t   t h e   u s e r   t o   c h o o s e   t h e   s o u r c e   a n d   d e s t i n a t i o n   f o l d e r s� ��� r    ��� I   �����
�� .sysostflalis    ��� null��  � �����
�� 
prmp� m   	 
�� ��� ( C h o o s e   s o u r c e   f o l d e r��  � o      ���� 0 sourcefolder sourceFolder� ��� r    ��� I   �����
�� .sysostflalis    ��� null��  � �����
�� 
prmp� m    �� ��� 2 C h o o s e   d e s t i n a t i o n   f o l d e r��  � o      ���� &0 destinationfolder destinationFolder� ��� l   ��������  ��  ��  � ��� l   ������  � M G Initialize counters for files processed, moved, and JSON files deleted   � ��� �   I n i t i a l i z e   c o u n t e r s   f o r   f i l e s   p r o c e s s e d ,   m o v e d ,   a n d   J S O N   f i l e s   d e l e t e d� ��� r     ��� J    �� ���� m    ����  ��  � o      ���� 0 filecountref fileCountRef� ��� r   ! &��� J   ! $�� ���� m   ! "����  ��  � o      ���� 0 movedcountref movedCountRef� ��� r   ' ,��� J   ' *�� ���� m   ' (����  ��  � o      ���� 0 jsoncountref jsonCountRef� ��� l  - -��������  ��  ��  � ��� l  - -������  � : 4 Start processing from the source folder recursively   � ��� h   S t a r t   p r o c e s s i n g   f r o m   t h e   s o u r c e   f o l d e r   r e c u r s i v e l y� ��� r   - S��� n  - ;��� I   . ;������� 0 processfolder processFolder� � � c   . 1 o   . /���� 0 sourcefolder sourceFolder m   / 0��
�� 
alis   c   1 4 o   1 2���� &0 destinationfolder destinationFolder m   2 3��
�� 
alis  o   4 5���� 0 filecountref fileCountRef 	
	 o   5 6���� 0 movedcountref movedCountRef
 �� o   6 7���� 0 jsoncountref jsonCountRef��  ��  �  f   - .� J        o      ����  0 finalfilecount finalFileCount  o      ���� "0 finalmovedcount finalMovedCount �� o      ����  0 finaljsoncount finalJsonCount��  �  l  T T��������  ��  ��    l  T T����   Q K Calculate the total number of files processed (moved + JSON files deleted)    � �   C a l c u l a t e   t h e   t o t a l   n u m b e r   o f   f i l e s   p r o c e s s e d   ( m o v e d   +   J S O N   f i l e s   d e l e t e d )  r   T c [   T _ l  T X���� n   T X !  4   U X��"
�� 
cobj" m   V W���� ! o   T U���� "0 finalmovedcount finalMovedCount��  ��   l  X ^#����# n   X ^$%$ 4   [ ^��&
�� 
cobj& m   \ ]���� % o   X [����  0 finaljsoncount finalJsonCount��  ��   o      ���� *0 totalprocessedcount totalProcessedCount '(' l  d d��������  ��  ��  ( )*) l  d d��+,��  + 0 * Display a summary dialog with the results   , �-- T   D i s p l a y   a   s u m m a r y   d i a l o g   w i t h   t h e   r e s u l t s* ./. I  d ���01
�� .sysodlogaskr        TEXT0 b   d �232 b   d �454 b   d �676 b   d �898 b   d �:;: b   d }<=< b   d y>?> b   d t@A@ b   d pBCB b   d lDED m   d gFF �GG & T o t a l   f i l e s   f o u n d :  E l  g kH����H n   g kIJI 4   h k��K
�� 
cobjK m   i j���� J o   g h����  0 finalfilecount finalFileCount��  ��  C o   l o��
�� 
ret A m   p sLL �MM & T o t a l   f i l e s   m o v e d :  ? l  t xN����N n   t xOPO 4   u x��Q
�� 
cobjQ m   v w���� P o   t u���� "0 finalmovedcount finalMovedCount��  ��  = o   y |��
�� 
ret ; m   } �RR �SS $ T o t a l   J S O N   f i l e s :  9 l  � �T����T n   � �UVU 4   � ���W
�� 
cobjW m   � ����� V o   � �����  0 finaljsoncount finalJsonCount��  ��  7 o   � ���
�� 
ret 5 m   � �XX �YY . T o t a l   f i l e s   p r o c e s s e d :  3 o   � ����� *0 totalprocessedcount totalProcessedCount1 ��Z[
�� 
btnsZ J   � �\\ ]��] m   � �^^ �__  O K��  [ ��`a
�� 
dflt` m   � �bb �cc  O Ka ��d��
�� 
dispd m   � ���
�� stic   ��  / efe n  � �ghg I   � ���i���� 0 writelog writeLogi j��j b   � �klk b   � �mnm b   � �opo b   � �qrq b   � �sts b   � �uvu b   � �wxw m   � �yy �zz 8 S u m m a r y :   T o t a l   f i l e s   f o u n d :  x l  � �{����{ n   � �|}| 4   � ���~
�� 
cobj~ m   � ����� } o   � �����  0 finalfilecount finalFileCount��  ��  v m   � � ��� * ,   T o t a l   f i l e s   m o v e d :  t l  � ������� n   � ���� 4   � ����
�� 
cobj� m   � ����� � o   � ����� "0 finalmovedcount finalMovedCount��  ��  r m   � ��� ��� ( ,   T o t a l   J S O N   f i l e s :  p l  � ������� n   � ���� 4   � ����
�� 
cobj� m   � ����� � o   � �����  0 finaljsoncount finalJsonCount��  ��  n m   � ��� ��� 2 ,   T o t a l   f i l e s   p r o c e s s e d :  l o   � ����� *0 totalprocessedcount totalProcessedCount��  ��  h  f   � �f ���� l  � ���������  ��  ��  ��  � R      ����
�� .ascrerr ****      � ****� o      ���� 0 errmsg errMsg� �����
�� 
errn� o      ���� 0 errnum errNum��  � k   �
�� ��� l  � �������  � W Q Log and display an error message if something goes wrong during folder selection   � ��� �   L o g   a n d   d i s p l a y   a n   e r r o r   m e s s a g e   i f   s o m e t h i n g   g o e s   w r o n g   d u r i n g   f o l d e r   s e l e c t i o n� ��� n  � ���� I   � �������� 0 writelog writeLog� ���� b   � ���� m   � ��� ��� 0 E r r o r   c h o o s i n g   f o l d e r s :  � o   � ����� 0 errmsg errMsg��  ��  �  f   � �� ���� I  �
����
�� .sysodisAaleR        TEXT� b   � ���� b   � ���� m   � ��� ��� . E r r o r   c h o o s i n g   f o l d e r s :� o   � ���
�� 
ret � o   � ����� 0 errmsg errMsg� ����
�� 
mesS� b   � ���� m   � ��� ���  E r r o r   N u m b e r :  � o   � ����� 0 errnum errNum� �����
�� 
as A� m  ��
�� EAlTwarN��  ��  � m     ���                                                                                  MACS  alis    @  Macintosh HD               ��BD ����
Finder.app                                                     ������        ����  
 cu             CoreServices  )/:System:Library:CoreServices:Finder.app/    
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  �  �  �       ���~�}�������������|�{�z�y�x�w�v�u�t�s�  � �r�q�p�o�n�m�l�k�j�i�h�g�f�e�d�c�b�a�`�_�^�]�\�[�r "0 dialogdebugflag dialogDebugFlag�q 0 logdebugflag logDebugFlag�p ,0 generaterandomsuffix generateRandomSuffix�o 0 writelog writeLog�n 0 processfolder processFolder
�m .aevtoappnull  �   � ****�l 0 sourcefolder sourceFolder�k &0 destinationfolder destinationFolder�j 0 filecountref fileCountRef�i 0 movedcountref movedCountRef�h 0 jsoncountref jsonCountRef�g  0 finalfilecount finalFileCount�f "0 finalmovedcount finalMovedCount�e  0 finaljsoncount finalJsonCount�d *0 totalprocessedcount totalProcessedCount�c  �b  �a  �`  �_  �^  �]  �\  �[  
�~ boovfals
�} boovfals� �Z ]�Y�X���W�Z ,0 generaterandomsuffix generateRandomSuffix�Y  �X  � �V�V 0 randomsuffix randomSuffix�  d�U
�U .sysoexecTEXT���     TEXT�W �j E�O�� �T w�S�R���Q�T 0 writelog writeLog�S �P��P �  �O�O 0 
logmessage 
logMessage�R  � �N�M�L�K�J�N 0 
logmessage 
logMessage�M 0 logfile logFile�L "0 currentdatetime currentDateTime�K 0 errmsg errMsg�J 0 errnum errNum� �I�H�G�F ��E�D ��C ��B ��A�@�?� ��> ��=�<�;�:
�I afdrdesk
�H 
rtyp
�G 
ctxt
�F .earsffdralis        afdr
�E .misccurdldt    ��� null
�D 
TEXT
�C 
ret 
�B 
strq
�A 
psxp
�@ .sysoexecTEXT���     TEXT�? 0 errmsg errMsg� �9�8�7
�9 
errn�8 0 errnum errNum�7  
�> 
mesS
�= 
as A
�< EAlTwarN�; 
�: .sysodisAaleR        TEXT�Q fb  e  \���l �%E�O*j �&E�O��%�%�%E�O ��,%�%��,�,%j W "X  a �%�%a a �%a a a  Y h� �6 ��5�4���3�6 0 processfolder processFolder�5 �2��2 �  �1�0�/�.�-�1 0 sourcefolder sourceFolder�0 &0 destinationfolder destinationFolder�/ 0 filecountref fileCountRef�. 0 movedcountref movedCountRef�- 0 jsoncountref jsonCountRef�4  � �,�+�*�)�(�'�&�%�$�#�"�!� ����������, 0 sourcefolder sourceFolder�+ &0 destinationfolder destinationFolder�* 0 filecountref fileCountRef�) 0 movedcountref movedCountRef�( 0 jsoncountref jsonCountRef�' 0 sourceitems sourceItems�& 0 
sourceitem 
sourceItem�% 0 subitems subItems�$ 0 filename fileName�# 0 fileextension fileExtension�" $0 parentfoldername parentFolderName�! 0 basename baseName�  *0 destinationfilepath destinationFilePath� $0 destinationalias destinationAlias� 0 
fileexists 
fileExists� 0 randomsuffix randomSuffix� 0 newname newName� 0 newfilepath newFilePath� 0 newfilealias newFileAlias�  0 remainingitems remainingItems� 0 errmsg errMsg� 0 errnum errNum� I�������������[�
�	������������ :<>Y[��r����������������������������FHNRy�����������������
� .coredoexnull���     obj 
� 
cobj
� 
ctxt� 0 writelog writeLog
� 
kocl
� .corecnte****       ****
� 
pcls
� 
cfol
� 
alis� � 0 processfolder processFolder
� .coredelonull���     obj 
�
 
docf
�	 
pnam
� 
nmxt
� 
ctnr
� 
psof
� 
psin� 
� .sysooffslong    ��� null�  �  �  ,0 generaterandomsuffix generateRandomSuffix
�� 
psxp
�� 
psxf
�� 
insh
�� .coremovenull���     obj 
�� 
btns
�� 
dflt
�� 
disp
�� stic   �� 
�� .sysodlogaskr        TEXT�� 0 errmsg errMsg� ������
�� 
errn�� 0 errnum errNum��  
�� 
ret 
�� 
mesS
�� 
as A
�� EAlTwarN
�� .sysodisAaleR        TEXT�3!�ؠj ʠ�-E�O)��&%k+ O|�[��l kh ��,�  X)��&�����+ E[�k/E�Z[�l/E�Z[�m/E�ZO�j  )��-E�O�j j  �j O)��&%k+ Y hY hY��,� ��k/k��k/FO�a ,E�O�a ,E�O�a ,a ,E�O�[�\[Zk\Z*a a �%a �a  k2E�O�a   !��k/k��k/FO�j O)a �%k+ Y���&�%E�O *�/E�OeE�W 
X  fE�O� �)j+ E�O�a %�%a %�%a %�%E^ O] �a ,FO)a  �%a !%] %k+ O��&a ",a #%] %E^ O*a $] /�&E^ O] a %�l &O)a '] %a (%��&%k+ O��k/k��k/FOb   e  0a )�%a *%] %a +%a ,a -kva .a /a 0a 1a 2 3Y hY ��a 4%�%a 5%�%E^ O] �a ,FO��&a ",a 6%] %E^ O*a $] /�&E^ O] a %�l &O)a 7] %a 8%��&%k+ O��k/k��k/FOb   e  *a 9] %a :%a ,a ;kva .a <a 0a 1a 2 3Y hY h[OY��O�j  /��-E^ O] j j  �j O)a =��&%k+ Y hY hY hOPW =X > ?)a @��&%a A%] %k+ Oa B_ C%] %a Da E] %a Fa Ga  HUO���mv� �����������
�� .aevtoappnull  �   � ****� k    �� �����  ��  ��  � ������ 0 errmsg errMsg�� 0 errnum errNum� .���������������������������������F��LRX��^��b��������y��������������������
�� 
prmp
�� .sysostflalis    ��� null�� 0 sourcefolder sourceFolder�� &0 destinationfolder destinationFolder�� 0 filecountref fileCountRef�� 0 movedcountref movedCountRef�� 0 jsoncountref jsonCountRef
�� 
alis�� �� 0 processfolder processFolder
�� 
cobj��  0 finalfilecount finalFileCount�� "0 finalmovedcount finalMovedCount��  0 finaljsoncount finalJsonCount�� *0 totalprocessedcount totalProcessedCount
�� 
ret 
�� 
btns
�� 
dflt
�� 
disp
�� stic   �� 
�� .sysodlogaskr        TEXT�� 0 writelog writeLog�� 0 errmsg errMsg� ������
�� 
errn�� 0 errnum errNum��  
�� 
mesS
�� 
as A
�� EAlTwarN�� 
�� .sysodisAaleR        TEXT��� �*��l E�O*��l E�OjkvE�OjkvE�OjkvE�O)��&��&����+ E[�k/E�Z[�l/E�Z[�m/E` ZO��k/_ �k/E` Oa ��k/%_ %a %��k/%_ %a %_ �k/%_ %a %_ %a a kva a a a a  O)a ��k/%a  %��k/%a !%_ �k/%a "%_ %k+ #OPW /X $ %)a &�%k+ #Oa '_ %�%a (a )�%a *a +a , -U�alis      Macintosh HD               ��BD ����Takeout                                                        ����❣�        ����  J cu            /:Users:tux:Downloads:Takeout/    T a k e o u t    M a c i n t o s h   H D  Users/tux/Downloads/Takeout   /    
��  �alis      Macintosh HD               ��BD ����Images                                                         ����❣�        ����  J cu            /:Users:tux:Downloads:Images/     I m a g e s    M a c i n t o s h   H D  Users/tux/Downloads/Images  /    
��  � ����� �  ����� ����� �  ������ ����� �  ������|�{  �z  �y  �x  �w  �v  �u  �t  �s   ascr  ��ޭ
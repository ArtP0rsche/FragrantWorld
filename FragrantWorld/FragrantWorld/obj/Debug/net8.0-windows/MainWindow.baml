   M S B A M L   `   `   `  ����H  DFragrantWorld, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null-clr-namespace:FragrantWorldFragrantWorld  5   	       FragrantWorld.MainWindow   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   -localclr-namespace:FragrantWorld     5   	     � Title$%  Просмотр товаров��5   	   $	��490��6"   $	��800��6/    � WindowStartupLocation$ CenterScreen=�6;   $	��490��5	   	   $	��800��6    � SizeToContent$ WidthAndHeight=�6(    � Icon$ /Pictures/icon.ico��6G   .��5
      �� .+�5   
   � $��21��6   $	��Top=�6    .+�5      �� $��/Pictures/logo.png��6   $
��5, 0q�60   �� 5      $&�� ООО Ароматный мир��6   $��0, 2.5q�61   5      ]� 5   
   $��Right=�6   .+�5      �� -   5        $��userInfoTextBlock��5      $��10, 0q�61   �� 5      -   5        $��
authButton��5      $��
Войти��6'   $��0,0,5,0q�67   6H   �� 5      -   5        $��
exitButton��5      $��
Выйти��6'   $��0,0,5,0q�67   $y�	Collapsed=�6H   6_   5      ]� 5   
   $��3.25 7.5q�6   .+�5      �� -   5        $��sortProductsComboBox��5      .@�5      �� $#��По возврастанию��6   �� 5      $��По убыванию��6   5      �� 5      -   5        $��manufacturerComboBox��5      63   � 5      $
��Left=�6    � ColumnDefinitions 5      �� 5      �� 5      .+�5      �� -   5         ��Name$ minPriceTextBox��5      $	��125��63   6j   �� 5       -   5        $��minPriceHintTextBlock��5       $%��Минимальная цена��69    J� IsHitTestVisible$ False��6Q   �� 5!      -   5        $ maxPriceTextBox��5!      $	��125��63   $��1��6?   6z   �� 5"      -	   5        $��maxPriceHintTextBlock��5"      $'��!Максимальная цена��69   $��1��6R   $ False��6b   5#      5$      ]� 5%   
   $��3.25 7.5q�6   .+�5&      � $
��Left=�6   .+�5'      �� -
   5        $��searchTextBox��5'      $	��300��6/   6;   �� 5(      -   5        $��hintSearchTextBlock��5(      $��
Поиск��67   $ False��6D   5)      �� 5*      -   5        $��countTextBlock��5*      $��0,0,5,0q�6.   $��Right=�6?   5+      �� 5,   
   -   5        $��goToOrderButton��5,      $!��Показать заказ��6(   $y�	Collapsed=�6A   6X   �� 5-   
   $
��Auto=�6   $	��410��6:   .��5.      �� -   5        $��productListBox��5.      ��5/      �� 50      .R�51      �� $��1q�6!   
���   �$��5,0,0,0q�6I    �� Padding$ 3q�6Z   ._�52      �� $	��730��6)   .+�53   "   �� $
��Bold"�6B   ��6,   �� *Name+6B   �� 54   "   ��6,   �� *Description+�� 55   "   ��6,   ��  �� StringFormat$% Производитель: {0}��	 �� Path$	 Manufacturer�]� 56   "   .+�57   &   �� $��
Цена: ��60   �� 58   &   $�� ��60   �� 59   &   ��60   �� $ {0:0.00} руб��$
	 Cost��� 5:   &   
 ��Name$
 orderButton��6-   -   5        $��Заказать��5:   B   $��Right=�6U   $	��100��6l   $��Right=�6x   6�   5;   #   5<      5=      5>      5@      5A      5B      5C      

                      $(document).ready( function () {
                 $('#datatable1').DataTable( {
                     dom: 'Blfrtip',
                     buttons: [
            'copy', 'excel', 'pdf', 'print'
        ]
              ,       language: {
                         
                         "url": "https://cdn.datatables.net/plug-ins/1.13.2/i18n/es-ES.json"
                         
                     }
                     ,responsive: true
                     
                 });
                 } );
        


////Script para datatable-->

            $(document).ready( function () {
                 $('#datatable').DataTable( {
                     dom: 'Blfrtip',
                     buttons: [
            'copy', 'excel', 'pdf', 'print'
        ]
              ,       language: {
                         
                         "url": "https://cdn.datatables.net/plug-ins/1.13.2/i18n/es-ES.json"
                         
                     }
                     ,responsive: true
                     
                 });
                 } );
        
            
            
            $(".sidebar ul li").on('click' , function(){
                $(".sidebar ul li.active").removeClass('active');
                $(this).addClass('active');
                
            });
            $(".open-btn").on('click' , function(){
                $('.sidebar').addClass('active');
                
            });
            
                 $(".close-btn").on('click' , function(){
                $('.sidebar').removeClass('active');
                
            });
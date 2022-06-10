Scanner ler = new Scanner(System.in);
		
		String cpf_f = "";
		int anoNascimento_f = 0;
		String nome_f;
		String mail_f = "";
		Float saldo = 0f;
		int insere = 1;

		while(insere == 1) {
			System.out.println("Insira CPF:. ");
			cpf_f = ler.next();
			
			System.out.println("Insira a data de Nascimento do Titular:. ");
			anoNascimento_f = ler.nextInt();
			
			System.out.println("Insira o Nome do Titular:. ");
			nome_f = ler.next();
			
			System.out.println("Insira o e-mail do Titular");
			mail_f = ler.next();
			
			System.out.println("Insira o saldo Inicial:. ");
			saldo = ler.nextFloat();
			
			Conta conta = new Conta(saldo);
			Cliente cliente = new Cliente(cpf_f, anoNascimento_f, nome_f, mail_f, conta);
			
			EntityManagerFactory factory = Persistence.createEntityManagerFactory("jpa_exemplo");
	        EntityManager manager = factory.createEntityManager();
	        
	        try {
	        	manager.getTransaction().begin();
		        manager.persist(cliente);
		        manager.getTransaction().commit();
	        }catch(PersistenceException err) {
	        	System.out.println("Erro na Inclusão do " + cliente.toString());
	        	System.out.println(err.getMessage());
	        }
	        
	        
	        manager.close()
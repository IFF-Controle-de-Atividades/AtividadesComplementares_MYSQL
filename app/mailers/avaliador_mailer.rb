class AvaliadorMailer < ActionMailer::Base
  default from: "no-reply@atividadescomeplementares.iff.edu.br"

  def new_avaliador_send_mail(user)
  	@user = user
  	mail({
			to: user.email,
			# bbc: ['bbc@rails.app','Nova Atividade Inserida <no-reply@atividadescomeplementares.iff.edu.br>'],
			subject: I18n.t('sendconfirmatividade.send_atividade_email.subject'),
			content_type: 'text/html'
		})
  end
end

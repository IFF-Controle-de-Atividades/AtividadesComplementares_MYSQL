#--*-- coding:utf-8 --*--
class SendConfirmAtividade < ActionMailer::Base
  default from: "no-reply@atividadescomeplementares.iff.edu.br"

  def send_atividade_email(user, atividade)
		@user = user
		@atividade = atividade

		mail({
			:to=> user.email,
			# :bbc=>["Nova Atividade Inserida <no-reply@atividadescomeplementares.iff.edu.br>"],
			:subject=> I18n.t('sendconfirmatividade.send_atividade_email.subject')
		})
	end
end
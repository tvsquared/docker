FROM jupyterhub/jupyterhub

RUN pip install notebook oauthenticator
RUN ln -s /home/backend /etc/skel/backend && ln -s /home/backend/datascience /etc/skel/datascience

CMD jupyterhub
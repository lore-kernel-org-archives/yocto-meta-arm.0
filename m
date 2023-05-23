Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D04CDC7EE26
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 23:36:23 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web11.18116.1684884980439844361
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 23 May 2023 16:36:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=yYj7eUd9;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.171, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-3f6a5c7e034so4354841cf.2
        for <meta-arm@lists.yoctoproject.org>; Tue, 23 May 2023 16:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1684884979; x=1687476979;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gGq5PQSbxDR9jjaU67e/zw6HLenTI5LIyb2c94YB7Q8=;
        b=yYj7eUd9r0UTkYXhalA9E4JlRIKJYWQCNZN5s5ev9gk6rFRXrXTX+1RkeKep6CFEpX
         I3Wvh6sUXhGEZuWlV9OleG1ihwubv2Za4WpX8pCOM8cYUB6JEXtozOxtE1HaDEWxeekP
         gyxiix/6873ioDLrD2sh9oLPNUczQjiVpXsfKCs3SZ3gSQGG81/0mdcIqxdN9oYJ7PA8
         n/VJkvkzQHTK2qKx9fNbUkXN6+yfmxI94KlQxRvdMwa+pziQvWj7WMjqlMzcpKFi1Z31
         +DFaKpu0Oph19KTlyMP6AxwvlxuJZQbTtlgwp+lOI0UGdUujSZ/Y4HI5VFXhy2Z/ym71
         sthw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684884979; x=1687476979;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gGq5PQSbxDR9jjaU67e/zw6HLenTI5LIyb2c94YB7Q8=;
        b=XVV4DSBsqxlfP7hbp16yyq4zZuQdLAMCHeR6Y2p9fmZ1eR1iOj9e1CJRUJXfw3Fnk4
         /L7Y62n2WgsSK8U63v+UOPJKQCvQCKpCaO2ZPBz/LavKIUkAx/7TwOeC2esYt6q1Hswa
         8tZxVKG/DwnMBflMsci3DNlzlzrERCO5hoGKCG184W1bhj1MgnddDgtfkqVsWrsfYv5s
         KwSrGV1xOSXnBkztf+zgP6pii8K3XsiYlVhTcI7NQD9GwtEzWsmcTCzr8A7O3wlte8jX
         lkU/JJgI/1VIH3NeRuQr746dfeOBkQNHJVVd/r2C6xLwVVDF9oLcdAjeIyw6RQGhWKnE
         4p1A==
X-Gm-Message-State: AC+VfDy3Z4LM2dFzSYGWvImpIoY9bEMa0UJGjuS1w4tUm4rITf9zSV/H
	1asNk9Z8XbSFO7PNeeN8zJVjEG6oP3PYP+YYEuo=
X-Google-Smtp-Source: ACHHUZ5QutfQzZCKKLkZNmoNkLlGslRAQgDkod3izawG0Y+zUYWFn2AeiVjnV2LCtioMb9CPBy5b5g==
X-Received: by 2002:ac8:7f01:0:b0:3f3:8e79:5742 with SMTP id f1-20020ac87f01000000b003f38e795742mr23248200qtk.19.1684884979483;
        Tue, 23 May 2023 16:36:19 -0700 (PDT)
Received: from kudzu.us ([2605:a601:a600:7900:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id u22-20020a05622a199600b003f6bc367ee3sm781271qtc.36.2023.05.23.16.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 16:36:18 -0700 (PDT)
Date: Tue, 23 May 2023 19:36:17 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Peter Hoyes <Peter.Hoyes@arm.com>
Cc: =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>,
	meta-arm@lists.yoctoproject.org
Subject: Re: [RFC PATCH v2 1/3] runfvp: make fvp runner to hold the config
Message-ID: <ZG1N8SqlH0vFTKoS@kudzu.us>
References: <20230517100913.96055-1-peron.clem@gmail.com>
 <CAJiuCcdWAbWn1hTAH4y89_0cWsaGZQu=h0ooA4FZDx6zeXDZKQ@mail.gmail.com>
 <45aa62cd-f77d-fc97-c64d-ecf579d12b3e@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <45aa62cd-f77d-fc97-c64d-ecf579d12b3e@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 23 May 2023 23:36:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4688

On Tue, May 23, 2023 at 05:06:41PM +0100, Peter Hoyes wrote:
> Hi Clement,
> 
> On 23/05/2023 12:40, Cl�ment P�ron wrote:
> > Hi Peter,
> > 
> > On Wed, 17 May 2023 at 12:09, Cl�ment P�ron <peron.clem@gmail.com> wrote:
> > > At the moment the config is load and pass to FVPRunner.
> > > 
> > > Change the ownership to FVPRunner.
> > What do you think about this patch?
> > 
> > I have moved the ownership of the config to the FVPRunner. Is it what
> > you had in mind?
> > 
> > Thanks for your feedback
> 
> First of all, this skipped my attention last week so apologies for the
> follow-up delay.
> 
> All three patches look great to me, but I'm having trouble applying them
> cleanly to master and I'm seeing CRLF line endings. It might be something at
> my end, but� is it possible you need to rebase and/or use git send-email ?
> 
> @Jon Mason: LGTM if it pases CI!

I applied them to met-arm master-next and it passes CI (when stacked
on top the other two pathes).  See
https://gitlab.com/jonmason00/meta-arm/-/pipelines/874749366

If there aren't any objections, I can apply all five.

Thanks,
Jon

> 
> Peter
> 
> > 
> > Regards,
> > Clement
> > 
> > 
> > > Signed-off-by: Cl�ment P�ron <peron.clem@gmail.com>
> > > ---
> > >   meta-arm/lib/fvp/runner.py                 | 15 +++++--
> > >   meta-arm/lib/oeqa/controllers/fvp.py       | 13 +++---
> > >   meta-arm/lib/oeqa/selftest/cases/runfvp.py | 49 +++++++++++++---------
> > >   scripts/runfvp                             | 11 +++--
> > >   4 files changed, 52 insertions(+), 36 deletions(-)
> > > 
> > > diff --git a/meta-arm/lib/fvp/runner.py b/meta-arm/lib/fvp/runner.py
> > > index d957e780..4f5f88ca 100644
> > > --- a/meta-arm/lib/fvp/runner.py
> > > +++ b/meta-arm/lib/fvp/runner.py
> > > @@ -6,7 +6,7 @@ import shutil
> > >   import sys
> > > 
> > >   from .terminal import terminals
> > > -
> > > +from .conffile import load
> > > 
> > >   def cli_from_config(config, terminal_choice):
> > >       cli = []
> > > @@ -83,14 +83,18 @@ class FVPRunner:
> > >           self._fvp_process = None
> > >           self._telnets = []
> > >           self._pexpects = []
> > > +        self._config = None
> > > +
> > > +    def start(self, fvpconf, extra_args=[], terminal_choice="none", stdout=subprocess.PIPE):
> > > +        self._logger.debug(f"Loading {fvpconf}")
> > > +        self._config = load(fvpconf)
> > > 
> > > -    def start(self, config, extra_args=[], terminal_choice="none", stdout=subprocess.PIPE):
> > > -        cli = cli_from_config(config, terminal_choice)
> > > +        cli = cli_from_config(self._config, terminal_choice)
> > >           cli += extra_args
> > > 
> > >           # Pass through environment variables needed for GUI applications, such
> > >           # as xterm, to work.
> > > -        env = config['env']
> > > +        env = self._config['env']
> > >           for name in ('DISPLAY', 'PATH', 'WAYLAND_DISPLAY', 'XAUTHORITY'):
> > >               if name in os.environ:
> > >                   env[name] = os.environ[name]
> > > @@ -140,6 +144,9 @@ class FVPRunner:
> > >       def wait(self, timeout):
> > >           self._fvp_process.wait(timeout)
> > > 
> > > +    def getConfig(self):
> > > +        return self._config
> > > +
> > >       @property
> > >       def stdout(self):
> > >           return self._fvp_process.stdout
> > > diff --git a/meta-arm/lib/oeqa/controllers/fvp.py b/meta-arm/lib/oeqa/controllers/fvp.py
> > > index e8a094f1..38484072 100644
> > > --- a/meta-arm/lib/oeqa/controllers/fvp.py
> > > +++ b/meta-arm/lib/oeqa/controllers/fvp.py
> > > @@ -3,7 +3,7 @@ import pexpect
> > >   import os
> > > 
> > >   from oeqa.core.target.ssh import OESSHTarget
> > > -from fvp import conffile, runner
> > > +from fvp import runner
> > > 
> > > 
> > >   class OEFVPSSHTarget(OESSHTarget):
> > > @@ -19,7 +19,6 @@ class OEFVPSSHTarget(OESSHTarget):
> > >           basename = pathlib.Path(rootfs)
> > >           basename = basename.name.replace("".join(basename.suffixes), "")
> > >           self.fvpconf = image_dir / (basename + ".fvpconf")
> > > -        self.config = conffile.load(self.fvpconf)
> > >           self.bootlog = bootlog
> > > 
> > >           if not self.fvpconf.exists():
> > > @@ -31,7 +30,7 @@ class OEFVPSSHTarget(OESSHTarget):
> > >       def start(self, **kwargs):
> > >           self.fvp_log = self._create_logfile("fvp")
> > >           self.fvp = runner.FVPRunner(self.logger)
> > > -        self.fvp.start(self.config, stdout=self.fvp_log)
> > > +        self.fvp.start(self.fvpconf, stdout=self.fvp_log)
> > >           self.logger.debug(f"Started FVP PID {self.fvp.pid()}")
> > >           self._after_start()
> > > 
> > > @@ -72,8 +71,9 @@ class OEFVPTarget(OEFVPSSHTarget):
> > >       def _after_start(self):
> > >           with open(self.fvp_log.name, 'rb') as logfile:
> > >               parser = runner.ConsolePortParser(logfile)
> > > -            self.logger.debug(f"Awaiting console on terminal {self.config['consoles']['default']}")
> > > -            port = parser.parse_port(self.config['consoles']['default'])
> > > +            config = self.fvp.getConfig()
> > > +            self.logger.debug(f"Awaiting console on terminal {config['consoles']['default']}")
> > > +            port = parser.parse_port(config['consoles']['default'])
> > >               console = self.fvp.create_pexpect(port)
> > >               try:
> > >                   console.expect("login\\:", timeout=self.boot_timeout)
> > > @@ -105,7 +105,8 @@ class OEFVPSerialTarget(OEFVPSSHTarget):
> > >       def _after_start(self):
> > >           with open(self.fvp_log.name, 'rb') as logfile:
> > >               parser = runner.ConsolePortParser(logfile)
> > > -            for name, console in self.config["consoles"].items():
> > > +            config = self.fvp.getConfig()
> > > +            for name, console in config["consoles"].items():
> > >                   logfile = self._create_logfile(name)
> > >                   self.logger.info(f'Creating terminal {name} on {console}')
> > >                   port = parser.parse_port(console)
> > > diff --git a/meta-arm/lib/oeqa/selftest/cases/runfvp.py b/meta-arm/lib/oeqa/selftest/cases/runfvp.py
> > > index 46941ca9..2d2cdc80 100644
> > > --- a/meta-arm/lib/oeqa/selftest/cases/runfvp.py
> > > +++ b/meta-arm/lib/oeqa/selftest/cases/runfvp.py
> > > @@ -1,5 +1,6 @@
> > >   import asyncio
> > >   import os
> > > +import json
> > >   import pathlib
> > >   import subprocess
> > >   import tempfile
> > > @@ -88,16 +89,20 @@ class RunnerTests(OESelftestTestCase):
> > >           from fvp import runner
> > >           with self.create_mock() as m:
> > >               fvp = runner.FVPRunner(self.logger)
> > > -            fvp.start({
> > > -                "fvp-bindir": "/usr/bin",
> > > -                "exe": "FVP_Binary",
> > > -                "parameters": {'foo': 'bar'},
> > > -                "data": ['data1'],
> > > -                "applications": {'a1': 'file'},
> > > -                "terminals": {},
> > > -                "args": ['--extra-arg'],
> > > -                "env": {"FOO": "BAR"}
> > > -            })
> > > +            config = {"fvp-bindir": "/usr/bin",
> > > +                    "exe": "FVP_Binary",
> > > +                    "parameters": {'foo': 'bar'},
> > > +                    "data": ['data1'],
> > > +                    "applications": {'a1': 'file'},
> > > +                    "terminals": {},
> > > +                    "args": ['--extra-arg'],
> > > +                    "env": {"FOO": "BAR"}
> > > +                     }
> > > +
> > > +            with tempfile.NamedTemporaryFile('w') as fvpconf:
> > > +                json.dump(config, fvpconf)
> > > +                fvpconf.flush()
> > > +                fvp.start(fvpconf.name)
> > > 
> > >               m.assert_called_once_with(['/usr/bin/FVP_Binary',
> > >                   '--parameter', 'foo=bar',
> > > @@ -114,16 +119,20 @@ class RunnerTests(OESelftestTestCase):
> > >           from fvp import runner
> > >           with self.create_mock() as m:
> > >               fvp = runner.FVPRunner(self.logger)
> > > -            fvp.start({
> > > -                "fvp-bindir": "/usr/bin",
> > > -                "exe": "FVP_Binary",
> > > -                "parameters": {},
> > > -                "data": [],
> > > -                "applications": {},
> > > -                "terminals": {},
> > > -                "args": [],
> > > -                "env": {"FOO": "BAR"}
> > > -            })
> > > +            config = {"fvp-bindir": "/usr/bin",
> > > +                      "exe": "FVP_Binary",
> > > +                      "parameters": {},
> > > +                      "data": [],
> > > +                      "applications": {},
> > > +                      "terminals": {},
> > > +                      "args": [],
> > > +                      "env": {"FOO": "BAR"}
> > > +                     }
> > > +
> > > +            with tempfile.NamedTemporaryFile('w') as fvpconf:
> > > +                json.dump(config, fvpconf)
> > > +                fvpconf.flush()
> > > +                fvp.start(fvpconf.name)
> > > 
> > >               m.assert_called_once_with(['/usr/bin/FVP_Binary'],
> > >                   stdin=unittest.mock.ANY,
> > > diff --git a/scripts/runfvp b/scripts/runfvp
> > > index e4b00abc..c2e536c8 100755
> > > --- a/scripts/runfvp
> > > +++ b/scripts/runfvp
> > > @@ -14,7 +14,7 @@ logger = logging.getLogger("RunFVP")
> > >   libdir = pathlib.Path(__file__).parents[1] / "meta-arm" / "lib"
> > >   sys.path.insert(0, str(libdir))
> > > 
> > > -from fvp import terminal, runner, conffile
> > > +from fvp import terminal, runner
> > > 
> > >   def parse_args(arguments):
> > >       import argparse
> > > @@ -49,12 +49,13 @@ def parse_args(arguments):
> > >       logger.debug(f"FVP arguments: {fvp_args}")
> > >       return args, fvp_args
> > > 
> > > -def start_fvp(args, config, extra_args):
> > > +def start_fvp(args, fvpconf, extra_args):
> > >       fvp = runner.FVPRunner(logger)
> > >       try:
> > > -        fvp.start(config, extra_args, args.terminals)
> > > +        fvp.start(fvpconf, extra_args, args.terminals)
> > > 
> > >           if args.console:
> > > +            config = fvp.getConfig()
> > >               expected_terminal = config["consoles"].get("default")
> > >               if expected_terminal is None:
> > >                   logger.error("--console used but FVP_CONSOLE not set in machine configuration")
> > > @@ -87,9 +88,7 @@ def runfvp(cli_args):
> > >           config_file = args.config
> > >       else:
> > >           config_file = conffile.find(args.config)
> > > -    logger.debug(f"Loading {config_file}")
> > > -    config = conffile.load(config_file)
> > > -    start_fvp(args, config, extra_args)
> > > +    start_fvp(args, config_file, extra_args)
> > > 
> > > 
> > >   if __name__ == "__main__":
> > > --
> > > 2.40.1
> > > 
> 


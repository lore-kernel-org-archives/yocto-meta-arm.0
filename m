Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32B5EC7EE23
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 08:47:54 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.4356.1684918068033613508
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 24 May 2023 01:47:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=O8xoaRK0;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: peron.clem@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-4f3a166f8e9so595757e87.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 24 May 2023 01:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684918066; x=1687510066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PJOQiaSrOpueiY2+g/9ajlz86osmB9e44K44r2qwoUw=;
        b=O8xoaRK09ZV3mMTw5NJfFjTouo0qJW/xKeIE0FmEZg5/FDIqBm7gQS6guRzYZDBLps
         nqa9tbmReR4pBYCXURfmRmpzoXgAGBxZbwhyLh9D2DJR+dvsZqwjj2GO8LXrKt9WjQFl
         kzKF7Ucl8pn+IVtVA551zO8h363rnDd104wCcNXN6IsuOcS10sXRiN639VYWzYIkBa91
         ZkOE2wGtfUuAtE1Esb12JogJV0s4Y3AwDBS0BTkvJSadF6KsvOFWBVQgFGfYjFsakKdK
         W3ajlkopLXHPDSroX5uCOB+xOirAvBD61NWT9HuOoHnp99XG9CZPaqoQTgMJhjito4fd
         teMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684918066; x=1687510066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PJOQiaSrOpueiY2+g/9ajlz86osmB9e44K44r2qwoUw=;
        b=Vd+8MPg3yLVhK0TVPMCfg8tWBebMTYhItRr4C0cMYH3Foga8Ixki5c0RrGd2tP/PVN
         ACb2HN0re8HaQNQkCtAxn6wqJ56OibnS5AaBJXu0BMevrZQiAQCeLROc0pS/ONkMNtxM
         JSxrPjfwZSX2vjQ96GJekyTJWlFXCFMq+0hdX10K6O/rKxvAe5kfIkEmHjfFgKlpdBl0
         +xfdr6AMsxGit1r6B4dkdK9bwB8Tcr1UlzL0jzzSBMVcH6G50DkyTm6G9oVAxH2SzBVz
         twpcQOaDZ+CY8ZQ4b9lwhob0GXUzbIxjRNNz8SrywlHgpyKOxIzmGMSWftsg4t1YzWSI
         Ayxw==
X-Gm-Message-State: AC+VfDzJhHEk5gO499njpR2F0RPX/8tBEvZQ7a/h14kRAPl9F0WCXK3b
	Ei1PZKuyt9jBqw1Oxt85TyFISuBMb3DW9k2ZXUo=
X-Google-Smtp-Source: ACHHUZ6/9x4atV+YoDid0lpToe7lLFAFk6R/Ik7nCgqzDFrIYF1++BH8PRFtpE0O/fzAicJuY8NpaEBFaVpv5zZ4vR0=
X-Received: by 2002:a05:6512:3b20:b0:4f3:a278:2d17 with SMTP id
 f32-20020a0565123b2000b004f3a2782d17mr6307787lfv.30.1684918065522; Wed, 24
 May 2023 01:47:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230517100913.96055-1-peron.clem@gmail.com> <CAJiuCcdWAbWn1hTAH4y89_0cWsaGZQu=h0ooA4FZDx6zeXDZKQ@mail.gmail.com>
 <45aa62cd-f77d-fc97-c64d-ecf579d12b3e@arm.com> <ZG1N8SqlH0vFTKoS@kudzu.us>
In-Reply-To: <ZG1N8SqlH0vFTKoS@kudzu.us>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Wed, 24 May 2023 10:47:34 +0200
Message-ID: <CAJiuCcfuavGEjgbgKnJLkLEUCZT_iFrptF61406Ehk8kxcEbaA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/3] runfvp: make fvp runner to hold the config
To: Jon Mason <jdmason@kudzu.us>
Cc: Peter Hoyes <Peter.Hoyes@arm.com>, meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 24 May 2023 08:47:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4689

Hi Jon, Peter,

On Wed, 24 May 2023 at 01:36, Jon Mason <jdmason@kudzu.us> wrote:
>
> On Tue, May 23, 2023 at 05:06:41PM +0100, Peter Hoyes wrote:
> > Hi Clement,
> >
> > On 23/05/2023 12:40, Cl=C3=A9ment P=C3=A9ron wrote:
> > > Hi Peter,
> > >
> > > On Wed, 17 May 2023 at 12:09, Cl=C3=A9ment P=C3=A9ron <peron.clem@gma=
il.com> wrote:
> > > > At the moment the config is load and pass to FVPRunner.
> > > >
> > > > Change the ownership to FVPRunner.
> > > What do you think about this patch?
> > >
> > > I have moved the ownership of the config to the FVPRunner. Is it what
> > > you had in mind?
> > >
> > > Thanks for your feedback
> >
> > First of all, this skipped my attention last week so apologies for the
> > follow-up delay.
> >
> > All three patches look great to me, but I'm having trouble applying the=
m
> > cleanly to master and I'm seeing CRLF line endings. It might be somethi=
ng at
> > my end, but  is it possible you need to rebase and/or use git send-emai=
l ?
> >
> > @Jon Mason: LGTM if it pases CI!
>
> I applied them to met-arm master-next and it passes CI (when stacked
> on top the other two pathes).  See
> https://gitlab.com/jonmason00/meta-arm/-/pipelines/874749366
>
> If there aren't any objections, I can apply all five.

That would be great, the last missing piece is the gator-daemon.

I'm now building a FVP image and running it inside Docker to get a
"almost deterministic" ARM benchmark running on different x86
hardware, that's cool :).

I'm not sure how people deal with benchmarks in CI, but this one seems
really stable.

Regards,
Clement

>
> Thanks,
> Jon
>
> >
> > Peter
> >
> > >
> > > Regards,
> > > Clement
> > >
> > >
> > > > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > > > ---
> > > >   meta-arm/lib/fvp/runner.py                 | 15 +++++--
> > > >   meta-arm/lib/oeqa/controllers/fvp.py       | 13 +++---
> > > >   meta-arm/lib/oeqa/selftest/cases/runfvp.py | 49 +++++++++++++----=
-----
> > > >   scripts/runfvp                             | 11 +++--
> > > >   4 files changed, 52 insertions(+), 36 deletions(-)
> > > >
> > > > diff --git a/meta-arm/lib/fvp/runner.py b/meta-arm/lib/fvp/runner.p=
y
> > > > index d957e780..4f5f88ca 100644
> > > > --- a/meta-arm/lib/fvp/runner.py
> > > > +++ b/meta-arm/lib/fvp/runner.py
> > > > @@ -6,7 +6,7 @@ import shutil
> > > >   import sys
> > > >
> > > >   from .terminal import terminals
> > > > -
> > > > +from .conffile import load
> > > >
> > > >   def cli_from_config(config, terminal_choice):
> > > >       cli =3D []
> > > > @@ -83,14 +83,18 @@ class FVPRunner:
> > > >           self._fvp_process =3D None
> > > >           self._telnets =3D []
> > > >           self._pexpects =3D []
> > > > +        self._config =3D None
> > > > +
> > > > +    def start(self, fvpconf, extra_args=3D[], terminal_choice=3D"n=
one", stdout=3Dsubprocess.PIPE):
> > > > +        self._logger.debug(f"Loading {fvpconf}")
> > > > +        self._config =3D load(fvpconf)
> > > >
> > > > -    def start(self, config, extra_args=3D[], terminal_choice=3D"no=
ne", stdout=3Dsubprocess.PIPE):
> > > > -        cli =3D cli_from_config(config, terminal_choice)
> > > > +        cli =3D cli_from_config(self._config, terminal_choice)
> > > >           cli +=3D extra_args
> > > >
> > > >           # Pass through environment variables needed for GUI appli=
cations, such
> > > >           # as xterm, to work.
> > > > -        env =3D config['env']
> > > > +        env =3D self._config['env']
> > > >           for name in ('DISPLAY', 'PATH', 'WAYLAND_DISPLAY', 'XAUTH=
ORITY'):
> > > >               if name in os.environ:
> > > >                   env[name] =3D os.environ[name]
> > > > @@ -140,6 +144,9 @@ class FVPRunner:
> > > >       def wait(self, timeout):
> > > >           self._fvp_process.wait(timeout)
> > > >
> > > > +    def getConfig(self):
> > > > +        return self._config
> > > > +
> > > >       @property
> > > >       def stdout(self):
> > > >           return self._fvp_process.stdout
> > > > diff --git a/meta-arm/lib/oeqa/controllers/fvp.py b/meta-arm/lib/oe=
qa/controllers/fvp.py
> > > > index e8a094f1..38484072 100644
> > > > --- a/meta-arm/lib/oeqa/controllers/fvp.py
> > > > +++ b/meta-arm/lib/oeqa/controllers/fvp.py
> > > > @@ -3,7 +3,7 @@ import pexpect
> > > >   import os
> > > >
> > > >   from oeqa.core.target.ssh import OESSHTarget
> > > > -from fvp import conffile, runner
> > > > +from fvp import runner
> > > >
> > > >
> > > >   class OEFVPSSHTarget(OESSHTarget):
> > > > @@ -19,7 +19,6 @@ class OEFVPSSHTarget(OESSHTarget):
> > > >           basename =3D pathlib.Path(rootfs)
> > > >           basename =3D basename.name.replace("".join(basename.suffi=
xes), "")
> > > >           self.fvpconf =3D image_dir / (basename + ".fvpconf")
> > > > -        self.config =3D conffile.load(self.fvpconf)
> > > >           self.bootlog =3D bootlog
> > > >
> > > >           if not self.fvpconf.exists():
> > > > @@ -31,7 +30,7 @@ class OEFVPSSHTarget(OESSHTarget):
> > > >       def start(self, **kwargs):
> > > >           self.fvp_log =3D self._create_logfile("fvp")
> > > >           self.fvp =3D runner.FVPRunner(self.logger)
> > > > -        self.fvp.start(self.config, stdout=3Dself.fvp_log)
> > > > +        self.fvp.start(self.fvpconf, stdout=3Dself.fvp_log)
> > > >           self.logger.debug(f"Started FVP PID {self.fvp.pid()}")
> > > >           self._after_start()
> > > >
> > > > @@ -72,8 +71,9 @@ class OEFVPTarget(OEFVPSSHTarget):
> > > >       def _after_start(self):
> > > >           with open(self.fvp_log.name, 'rb') as logfile:
> > > >               parser =3D runner.ConsolePortParser(logfile)
> > > > -            self.logger.debug(f"Awaiting console on terminal {self=
.config['consoles']['default']}")
> > > > -            port =3D parser.parse_port(self.config['consoles']['de=
fault'])
> > > > +            config =3D self.fvp.getConfig()
> > > > +            self.logger.debug(f"Awaiting console on terminal {conf=
ig['consoles']['default']}")
> > > > +            port =3D parser.parse_port(config['consoles']['default=
'])
> > > >               console =3D self.fvp.create_pexpect(port)
> > > >               try:
> > > >                   console.expect("login\\:", timeout=3Dself.boot_ti=
meout)
> > > > @@ -105,7 +105,8 @@ class OEFVPSerialTarget(OEFVPSSHTarget):
> > > >       def _after_start(self):
> > > >           with open(self.fvp_log.name, 'rb') as logfile:
> > > >               parser =3D runner.ConsolePortParser(logfile)
> > > > -            for name, console in self.config["consoles"].items():
> > > > +            config =3D self.fvp.getConfig()
> > > > +            for name, console in config["consoles"].items():
> > > >                   logfile =3D self._create_logfile(name)
> > > >                   self.logger.info(f'Creating terminal {name} on {c=
onsole}')
> > > >                   port =3D parser.parse_port(console)
> > > > diff --git a/meta-arm/lib/oeqa/selftest/cases/runfvp.py b/meta-arm/=
lib/oeqa/selftest/cases/runfvp.py
> > > > index 46941ca9..2d2cdc80 100644
> > > > --- a/meta-arm/lib/oeqa/selftest/cases/runfvp.py
> > > > +++ b/meta-arm/lib/oeqa/selftest/cases/runfvp.py
> > > > @@ -1,5 +1,6 @@
> > > >   import asyncio
> > > >   import os
> > > > +import json
> > > >   import pathlib
> > > >   import subprocess
> > > >   import tempfile
> > > > @@ -88,16 +89,20 @@ class RunnerTests(OESelftestTestCase):
> > > >           from fvp import runner
> > > >           with self.create_mock() as m:
> > > >               fvp =3D runner.FVPRunner(self.logger)
> > > > -            fvp.start({
> > > > -                "fvp-bindir": "/usr/bin",
> > > > -                "exe": "FVP_Binary",
> > > > -                "parameters": {'foo': 'bar'},
> > > > -                "data": ['data1'],
> > > > -                "applications": {'a1': 'file'},
> > > > -                "terminals": {},
> > > > -                "args": ['--extra-arg'],
> > > > -                "env": {"FOO": "BAR"}
> > > > -            })
> > > > +            config =3D {"fvp-bindir": "/usr/bin",
> > > > +                    "exe": "FVP_Binary",
> > > > +                    "parameters": {'foo': 'bar'},
> > > > +                    "data": ['data1'],
> > > > +                    "applications": {'a1': 'file'},
> > > > +                    "terminals": {},
> > > > +                    "args": ['--extra-arg'],
> > > > +                    "env": {"FOO": "BAR"}
> > > > +                     }
> > > > +
> > > > +            with tempfile.NamedTemporaryFile('w') as fvpconf:
> > > > +                json.dump(config, fvpconf)
> > > > +                fvpconf.flush()
> > > > +                fvp.start(fvpconf.name)
> > > >
> > > >               m.assert_called_once_with(['/usr/bin/FVP_Binary',
> > > >                   '--parameter', 'foo=3Dbar',
> > > > @@ -114,16 +119,20 @@ class RunnerTests(OESelftestTestCase):
> > > >           from fvp import runner
> > > >           with self.create_mock() as m:
> > > >               fvp =3D runner.FVPRunner(self.logger)
> > > > -            fvp.start({
> > > > -                "fvp-bindir": "/usr/bin",
> > > > -                "exe": "FVP_Binary",
> > > > -                "parameters": {},
> > > > -                "data": [],
> > > > -                "applications": {},
> > > > -                "terminals": {},
> > > > -                "args": [],
> > > > -                "env": {"FOO": "BAR"}
> > > > -            })
> > > > +            config =3D {"fvp-bindir": "/usr/bin",
> > > > +                      "exe": "FVP_Binary",
> > > > +                      "parameters": {},
> > > > +                      "data": [],
> > > > +                      "applications": {},
> > > > +                      "terminals": {},
> > > > +                      "args": [],
> > > > +                      "env": {"FOO": "BAR"}
> > > > +                     }
> > > > +
> > > > +            with tempfile.NamedTemporaryFile('w') as fvpconf:
> > > > +                json.dump(config, fvpconf)
> > > > +                fvpconf.flush()
> > > > +                fvp.start(fvpconf.name)
> > > >
> > > >               m.assert_called_once_with(['/usr/bin/FVP_Binary'],
> > > >                   stdin=3Dunittest.mock.ANY,
> > > > diff --git a/scripts/runfvp b/scripts/runfvp
> > > > index e4b00abc..c2e536c8 100755
> > > > --- a/scripts/runfvp
> > > > +++ b/scripts/runfvp
> > > > @@ -14,7 +14,7 @@ logger =3D logging.getLogger("RunFVP")
> > > >   libdir =3D pathlib.Path(__file__).parents[1] / "meta-arm" / "lib"
> > > >   sys.path.insert(0, str(libdir))
> > > >
> > > > -from fvp import terminal, runner, conffile
> > > > +from fvp import terminal, runner
> > > >
> > > >   def parse_args(arguments):
> > > >       import argparse
> > > > @@ -49,12 +49,13 @@ def parse_args(arguments):
> > > >       logger.debug(f"FVP arguments: {fvp_args}")
> > > >       return args, fvp_args
> > > >
> > > > -def start_fvp(args, config, extra_args):
> > > > +def start_fvp(args, fvpconf, extra_args):
> > > >       fvp =3D runner.FVPRunner(logger)
> > > >       try:
> > > > -        fvp.start(config, extra_args, args.terminals)
> > > > +        fvp.start(fvpconf, extra_args, args.terminals)
> > > >
> > > >           if args.console:
> > > > +            config =3D fvp.getConfig()
> > > >               expected_terminal =3D config["consoles"].get("default=
")
> > > >               if expected_terminal is None:
> > > >                   logger.error("--console used but FVP_CONSOLE not =
set in machine configuration")
> > > > @@ -87,9 +88,7 @@ def runfvp(cli_args):
> > > >           config_file =3D args.config
> > > >       else:
> > > >           config_file =3D conffile.find(args.config)
> > > > -    logger.debug(f"Loading {config_file}")
> > > > -    config =3D conffile.load(config_file)
> > > > -    start_fvp(args, config, extra_args)
> > > > +    start_fvp(args, config_file, extra_args)
> > > >
> > > >
> > > >   if __name__ =3D=3D "__main__":
> > > > --
> > > > 2.40.1
> > > >
> >


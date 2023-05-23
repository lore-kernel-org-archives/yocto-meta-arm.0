Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88713C7EE23
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 11:40:49 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.19761.1684842039466803208
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 23 May 2023 04:40:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=HjUDcS5B;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: peron.clem@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-4f4b0a0b557so2331414e87.1
        for <meta-arm@lists.yoctoproject.org>; Tue, 23 May 2023 04:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684842036; x=1687434036;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3E10k6xJ5dzq88k4BiH2B6LupllAEBfGl88bIw53BSg=;
        b=HjUDcS5BUFr7C3Q4MvcsC6Xd99iB3XG0/gyC3p0uQc9DS+wh/4GDDN/5OVCndPl11/
         eSxa72Vm4oa6ZOZOYaM4q/CwzzgpuHfFTp5X8Hhjm0zrC+ZEclIrDC4pGfDh9p5DRDHe
         WgqgM0IuJoJYZ9of9LToVj8TZZWRyRNDFTd3vr1DF7hmCWuF7SkckYy7qPYCBLfi6KEA
         +p4pUd9nC94LW+6unkS1ior/UMwJyILke44rQgL+6hOMmrEEOVgdFgwJkkHjNIrKeIkH
         4cVT6Z5QF0Qjw6v8Tklp0xldrj67TfRVxjsQT4G/yBwt2JrfmlKj3AoBkoLKzB2nmuUv
         9XxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684842037; x=1687434037;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3E10k6xJ5dzq88k4BiH2B6LupllAEBfGl88bIw53BSg=;
        b=Ri61FOYPtgWvItT3WXYmie0FzdwQDf3dJ+KSb7IcaFOJXS4n3rLSFBvpkuaiuceCoX
         ny+iSqxlxCMu/YLhi7q9pNxj0tNRp9t+O71ofwBunL/yIYiV0DieECcda95Ph3SiIY0W
         +//1sTEJBNT+eIFJGw+wkKkHFo5n4LBhmEByimsRNJvVqlAFvTCGidecoUp/EbTUuMNl
         rqRDvT8uaXQ+vczyDGD3bxADJys7Lq46DA8D7MMQ6BRJ8SeZlKMPrW9m50caRZ4M3O8c
         bmFOLmpr4uYdrWc0yi4xuYc4ioMKWJoc+ldswAMnmGgxm9lDOROH7GnyKzwLXyZZan9s
         k88Q==
X-Gm-Message-State: AC+VfDwINQfdz6fOKmitIXgDXTKIYo3GIfM7wcFaKULndXzoYvJ9entw
	1Qf5Xr87UdLa5NO9X1G0Q8ljoEX7uELEMek2oSco1wxKEL4=
X-Google-Smtp-Source: ACHHUZ4HI8f3PQPVnz8+RSXJKau+xUc+dwJtt/uORUDchCSb9oOxr7TeebAU0/wPC2jGe0CpVlk8weXYHPPW4naOIvY=
X-Received: by 2002:a2e:96c3:0:b0:2af:2088:2548 with SMTP id
 d3-20020a2e96c3000000b002af20882548mr6068654ljj.21.1684842036159; Tue, 23 May
 2023 04:40:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230517100913.96055-1-peron.clem@gmail.com>
In-Reply-To: <20230517100913.96055-1-peron.clem@gmail.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Tue, 23 May 2023 13:40:25 +0200
Message-ID: <CAJiuCcdWAbWn1hTAH4y89_0cWsaGZQu=h0ooA4FZDx6zeXDZKQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/3] runfvp: make fvp runner to hold the config
To: meta-arm@lists.yoctoproject.org
Cc: Peter Hoyes <Peter.Hoyes@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 23 May 2023 11:40:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4686

Hi Peter,

On Wed, 17 May 2023 at 12:09, Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com=
> wrote:
>
> At the moment the config is load and pass to FVPRunner.
>
> Change the ownership to FVPRunner.

What do you think about this patch?

I have moved the ownership of the config to the FVPRunner. Is it what
you had in mind?

Thanks for your feedback

Regards,
Clement


>
> Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> ---
>  meta-arm/lib/fvp/runner.py                 | 15 +++++--
>  meta-arm/lib/oeqa/controllers/fvp.py       | 13 +++---
>  meta-arm/lib/oeqa/selftest/cases/runfvp.py | 49 +++++++++++++---------
>  scripts/runfvp                             | 11 +++--
>  4 files changed, 52 insertions(+), 36 deletions(-)
>
> diff --git a/meta-arm/lib/fvp/runner.py b/meta-arm/lib/fvp/runner.py
> index d957e780..4f5f88ca 100644
> --- a/meta-arm/lib/fvp/runner.py
> +++ b/meta-arm/lib/fvp/runner.py
> @@ -6,7 +6,7 @@ import shutil
>  import sys
>
>  from .terminal import terminals
> -
> +from .conffile import load
>
>  def cli_from_config(config, terminal_choice):
>      cli =3D []
> @@ -83,14 +83,18 @@ class FVPRunner:
>          self._fvp_process =3D None
>          self._telnets =3D []
>          self._pexpects =3D []
> +        self._config =3D None
> +
> +    def start(self, fvpconf, extra_args=3D[], terminal_choice=3D"none", =
stdout=3Dsubprocess.PIPE):
> +        self._logger.debug(f"Loading {fvpconf}")
> +        self._config =3D load(fvpconf)
>
> -    def start(self, config, extra_args=3D[], terminal_choice=3D"none", s=
tdout=3Dsubprocess.PIPE):
> -        cli =3D cli_from_config(config, terminal_choice)
> +        cli =3D cli_from_config(self._config, terminal_choice)
>          cli +=3D extra_args
>
>          # Pass through environment variables needed for GUI applications=
, such
>          # as xterm, to work.
> -        env =3D config['env']
> +        env =3D self._config['env']
>          for name in ('DISPLAY', 'PATH', 'WAYLAND_DISPLAY', 'XAUTHORITY')=
:
>              if name in os.environ:
>                  env[name] =3D os.environ[name]
> @@ -140,6 +144,9 @@ class FVPRunner:
>      def wait(self, timeout):
>          self._fvp_process.wait(timeout)
>
> +    def getConfig(self):
> +        return self._config
> +
>      @property
>      def stdout(self):
>          return self._fvp_process.stdout
> diff --git a/meta-arm/lib/oeqa/controllers/fvp.py b/meta-arm/lib/oeqa/con=
trollers/fvp.py
> index e8a094f1..38484072 100644
> --- a/meta-arm/lib/oeqa/controllers/fvp.py
> +++ b/meta-arm/lib/oeqa/controllers/fvp.py
> @@ -3,7 +3,7 @@ import pexpect
>  import os
>
>  from oeqa.core.target.ssh import OESSHTarget
> -from fvp import conffile, runner
> +from fvp import runner
>
>
>  class OEFVPSSHTarget(OESSHTarget):
> @@ -19,7 +19,6 @@ class OEFVPSSHTarget(OESSHTarget):
>          basename =3D pathlib.Path(rootfs)
>          basename =3D basename.name.replace("".join(basename.suffixes), "=
")
>          self.fvpconf =3D image_dir / (basename + ".fvpconf")
> -        self.config =3D conffile.load(self.fvpconf)
>          self.bootlog =3D bootlog
>
>          if not self.fvpconf.exists():
> @@ -31,7 +30,7 @@ class OEFVPSSHTarget(OESSHTarget):
>      def start(self, **kwargs):
>          self.fvp_log =3D self._create_logfile("fvp")
>          self.fvp =3D runner.FVPRunner(self.logger)
> -        self.fvp.start(self.config, stdout=3Dself.fvp_log)
> +        self.fvp.start(self.fvpconf, stdout=3Dself.fvp_log)
>          self.logger.debug(f"Started FVP PID {self.fvp.pid()}")
>          self._after_start()
>
> @@ -72,8 +71,9 @@ class OEFVPTarget(OEFVPSSHTarget):
>      def _after_start(self):
>          with open(self.fvp_log.name, 'rb') as logfile:
>              parser =3D runner.ConsolePortParser(logfile)
> -            self.logger.debug(f"Awaiting console on terminal {self.confi=
g['consoles']['default']}")
> -            port =3D parser.parse_port(self.config['consoles']['default'=
])
> +            config =3D self.fvp.getConfig()
> +            self.logger.debug(f"Awaiting console on terminal {config['co=
nsoles']['default']}")
> +            port =3D parser.parse_port(config['consoles']['default'])
>              console =3D self.fvp.create_pexpect(port)
>              try:
>                  console.expect("login\\:", timeout=3Dself.boot_timeout)
> @@ -105,7 +105,8 @@ class OEFVPSerialTarget(OEFVPSSHTarget):
>      def _after_start(self):
>          with open(self.fvp_log.name, 'rb') as logfile:
>              parser =3D runner.ConsolePortParser(logfile)
> -            for name, console in self.config["consoles"].items():
> +            config =3D self.fvp.getConfig()
> +            for name, console in config["consoles"].items():
>                  logfile =3D self._create_logfile(name)
>                  self.logger.info(f'Creating terminal {name} on {console}=
')
>                  port =3D parser.parse_port(console)
> diff --git a/meta-arm/lib/oeqa/selftest/cases/runfvp.py b/meta-arm/lib/oe=
qa/selftest/cases/runfvp.py
> index 46941ca9..2d2cdc80 100644
> --- a/meta-arm/lib/oeqa/selftest/cases/runfvp.py
> +++ b/meta-arm/lib/oeqa/selftest/cases/runfvp.py
> @@ -1,5 +1,6 @@
>  import asyncio
>  import os
> +import json
>  import pathlib
>  import subprocess
>  import tempfile
> @@ -88,16 +89,20 @@ class RunnerTests(OESelftestTestCase):
>          from fvp import runner
>          with self.create_mock() as m:
>              fvp =3D runner.FVPRunner(self.logger)
> -            fvp.start({
> -                "fvp-bindir": "/usr/bin",
> -                "exe": "FVP_Binary",
> -                "parameters": {'foo': 'bar'},
> -                "data": ['data1'],
> -                "applications": {'a1': 'file'},
> -                "terminals": {},
> -                "args": ['--extra-arg'],
> -                "env": {"FOO": "BAR"}
> -            })
> +            config =3D {"fvp-bindir": "/usr/bin",
> +                    "exe": "FVP_Binary",
> +                    "parameters": {'foo': 'bar'},
> +                    "data": ['data1'],
> +                    "applications": {'a1': 'file'},
> +                    "terminals": {},
> +                    "args": ['--extra-arg'],
> +                    "env": {"FOO": "BAR"}
> +                     }
> +
> +            with tempfile.NamedTemporaryFile('w') as fvpconf:
> +                json.dump(config, fvpconf)
> +                fvpconf.flush()
> +                fvp.start(fvpconf.name)
>
>              m.assert_called_once_with(['/usr/bin/FVP_Binary',
>                  '--parameter', 'foo=3Dbar',
> @@ -114,16 +119,20 @@ class RunnerTests(OESelftestTestCase):
>          from fvp import runner
>          with self.create_mock() as m:
>              fvp =3D runner.FVPRunner(self.logger)
> -            fvp.start({
> -                "fvp-bindir": "/usr/bin",
> -                "exe": "FVP_Binary",
> -                "parameters": {},
> -                "data": [],
> -                "applications": {},
> -                "terminals": {},
> -                "args": [],
> -                "env": {"FOO": "BAR"}
> -            })
> +            config =3D {"fvp-bindir": "/usr/bin",
> +                      "exe": "FVP_Binary",
> +                      "parameters": {},
> +                      "data": [],
> +                      "applications": {},
> +                      "terminals": {},
> +                      "args": [],
> +                      "env": {"FOO": "BAR"}
> +                     }
> +
> +            with tempfile.NamedTemporaryFile('w') as fvpconf:
> +                json.dump(config, fvpconf)
> +                fvpconf.flush()
> +                fvp.start(fvpconf.name)
>
>              m.assert_called_once_with(['/usr/bin/FVP_Binary'],
>                  stdin=3Dunittest.mock.ANY,
> diff --git a/scripts/runfvp b/scripts/runfvp
> index e4b00abc..c2e536c8 100755
> --- a/scripts/runfvp
> +++ b/scripts/runfvp
> @@ -14,7 +14,7 @@ logger =3D logging.getLogger("RunFVP")
>  libdir =3D pathlib.Path(__file__).parents[1] / "meta-arm" / "lib"
>  sys.path.insert(0, str(libdir))
>
> -from fvp import terminal, runner, conffile
> +from fvp import terminal, runner
>
>  def parse_args(arguments):
>      import argparse
> @@ -49,12 +49,13 @@ def parse_args(arguments):
>      logger.debug(f"FVP arguments: {fvp_args}")
>      return args, fvp_args
>
> -def start_fvp(args, config, extra_args):
> +def start_fvp(args, fvpconf, extra_args):
>      fvp =3D runner.FVPRunner(logger)
>      try:
> -        fvp.start(config, extra_args, args.terminals)
> +        fvp.start(fvpconf, extra_args, args.terminals)
>
>          if args.console:
> +            config =3D fvp.getConfig()
>              expected_terminal =3D config["consoles"].get("default")
>              if expected_terminal is None:
>                  logger.error("--console used but FVP_CONSOLE not set in =
machine configuration")
> @@ -87,9 +88,7 @@ def runfvp(cli_args):
>          config_file =3D args.config
>      else:
>          config_file =3D conffile.find(args.config)
> -    logger.debug(f"Loading {config_file}")
> -    config =3D conffile.load(config_file)
> -    start_fvp(args, config, extra_args)
> +    start_fvp(args, config_file, extra_args)
>
>
>  if __name__ =3D=3D "__main__":
> --
> 2.40.1
>


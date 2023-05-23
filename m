Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F437C7EE26
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 16:07:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.715.1684858064123052486
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 23 May 2023 09:07:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4A7AB139F;
	Tue, 23 May 2023 09:08:28 -0700 (PDT)
Received: from [10.1.199.64] (unknown [10.1.199.64])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DECA43F67D;
	Tue, 23 May 2023 09:07:42 -0700 (PDT)
Message-ID: <45aa62cd-f77d-fc97-c64d-ecf579d12b3e@arm.com>
Date: Tue, 23 May 2023 17:06:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC PATCH v2 1/3] runfvp: make fvp runner to hold the config
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 meta-arm@lists.yoctoproject.org
References: <20230517100913.96055-1-peron.clem@gmail.com>
 <CAJiuCcdWAbWn1hTAH4y89_0cWsaGZQu=h0ooA4FZDx6zeXDZKQ@mail.gmail.com>
Content-Language: en-US
From: Peter Hoyes <Peter.Hoyes@arm.com>
In-Reply-To: <CAJiuCcdWAbWn1hTAH4y89_0cWsaGZQu=h0ooA4FZDx6zeXDZKQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 23 May 2023 16:07:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4687

Hi Clement,

On 23/05/2023 12:40, Cl=C3=A9ment P=C3=A9ron wrote:
> Hi Peter,
>
> On Wed, 17 May 2023 at 12:09, Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail=
.com> wrote:
>> At the moment the config is load and pass to FVPRunner.
>>
>> Change the ownership to FVPRunner.
> What do you think about this patch?
>
> I have moved the ownership of the config to the FVPRunner. Is it what
> you had in mind?
>
> Thanks for your feedback

First of all, this skipped my attention last week so apologies for the=20
follow-up delay.

All three patches look great to me, but I'm having trouble applying them=20
cleanly to master and I'm seeing CRLF line endings. It might be=20
something at my end, but=C2=A0 is it possible you need to rebase and/or u=
se=20
git send-email ?

@Jon Mason: LGTM if it pases CI!

Peter

>
> Regards,
> Clement
>
>
>> Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
>> ---
>>   meta-arm/lib/fvp/runner.py                 | 15 +++++--
>>   meta-arm/lib/oeqa/controllers/fvp.py       | 13 +++---
>>   meta-arm/lib/oeqa/selftest/cases/runfvp.py | 49 +++++++++++++-------=
--
>>   scripts/runfvp                             | 11 +++--
>>   4 files changed, 52 insertions(+), 36 deletions(-)
>>
>> diff --git a/meta-arm/lib/fvp/runner.py b/meta-arm/lib/fvp/runner.py
>> index d957e780..4f5f88ca 100644
>> --- a/meta-arm/lib/fvp/runner.py
>> +++ b/meta-arm/lib/fvp/runner.py
>> @@ -6,7 +6,7 @@ import shutil
>>   import sys
>>
>>   from .terminal import terminals
>> -
>> +from .conffile import load
>>
>>   def cli_from_config(config, terminal_choice):
>>       cli =3D []
>> @@ -83,14 +83,18 @@ class FVPRunner:
>>           self._fvp_process =3D None
>>           self._telnets =3D []
>>           self._pexpects =3D []
>> +        self._config =3D None
>> +
>> +    def start(self, fvpconf, extra_args=3D[], terminal_choice=3D"none=
", stdout=3Dsubprocess.PIPE):
>> +        self._logger.debug(f"Loading {fvpconf}")
>> +        self._config =3D load(fvpconf)
>>
>> -    def start(self, config, extra_args=3D[], terminal_choice=3D"none"=
, stdout=3Dsubprocess.PIPE):
>> -        cli =3D cli_from_config(config, terminal_choice)
>> +        cli =3D cli_from_config(self._config, terminal_choice)
>>           cli +=3D extra_args
>>
>>           # Pass through environment variables needed for GUI applicat=
ions, such
>>           # as xterm, to work.
>> -        env =3D config['env']
>> +        env =3D self._config['env']
>>           for name in ('DISPLAY', 'PATH', 'WAYLAND_DISPLAY', 'XAUTHORI=
TY'):
>>               if name in os.environ:
>>                   env[name] =3D os.environ[name]
>> @@ -140,6 +144,9 @@ class FVPRunner:
>>       def wait(self, timeout):
>>           self._fvp_process.wait(timeout)
>>
>> +    def getConfig(self):
>> +        return self._config
>> +
>>       @property
>>       def stdout(self):
>>           return self._fvp_process.stdout
>> diff --git a/meta-arm/lib/oeqa/controllers/fvp.py b/meta-arm/lib/oeqa/=
controllers/fvp.py
>> index e8a094f1..38484072 100644
>> --- a/meta-arm/lib/oeqa/controllers/fvp.py
>> +++ b/meta-arm/lib/oeqa/controllers/fvp.py
>> @@ -3,7 +3,7 @@ import pexpect
>>   import os
>>
>>   from oeqa.core.target.ssh import OESSHTarget
>> -from fvp import conffile, runner
>> +from fvp import runner
>>
>>
>>   class OEFVPSSHTarget(OESSHTarget):
>> @@ -19,7 +19,6 @@ class OEFVPSSHTarget(OESSHTarget):
>>           basename =3D pathlib.Path(rootfs)
>>           basename =3D basename.name.replace("".join(basename.suffixes=
), "")
>>           self.fvpconf =3D image_dir / (basename + ".fvpconf")
>> -        self.config =3D conffile.load(self.fvpconf)
>>           self.bootlog =3D bootlog
>>
>>           if not self.fvpconf.exists():
>> @@ -31,7 +30,7 @@ class OEFVPSSHTarget(OESSHTarget):
>>       def start(self, **kwargs):
>>           self.fvp_log =3D self._create_logfile("fvp")
>>           self.fvp =3D runner.FVPRunner(self.logger)
>> -        self.fvp.start(self.config, stdout=3Dself.fvp_log)
>> +        self.fvp.start(self.fvpconf, stdout=3Dself.fvp_log)
>>           self.logger.debug(f"Started FVP PID {self.fvp.pid()}")
>>           self._after_start()
>>
>> @@ -72,8 +71,9 @@ class OEFVPTarget(OEFVPSSHTarget):
>>       def _after_start(self):
>>           with open(self.fvp_log.name, 'rb') as logfile:
>>               parser =3D runner.ConsolePortParser(logfile)
>> -            self.logger.debug(f"Awaiting console on terminal {self.co=
nfig['consoles']['default']}")
>> -            port =3D parser.parse_port(self.config['consoles']['defau=
lt'])
>> +            config =3D self.fvp.getConfig()
>> +            self.logger.debug(f"Awaiting console on terminal {config[=
'consoles']['default']}")
>> +            port =3D parser.parse_port(config['consoles']['default'])
>>               console =3D self.fvp.create_pexpect(port)
>>               try:
>>                   console.expect("login\\:", timeout=3Dself.boot_timeo=
ut)
>> @@ -105,7 +105,8 @@ class OEFVPSerialTarget(OEFVPSSHTarget):
>>       def _after_start(self):
>>           with open(self.fvp_log.name, 'rb') as logfile:
>>               parser =3D runner.ConsolePortParser(logfile)
>> -            for name, console in self.config["consoles"].items():
>> +            config =3D self.fvp.getConfig()
>> +            for name, console in config["consoles"].items():
>>                   logfile =3D self._create_logfile(name)
>>                   self.logger.info(f'Creating terminal {name} on {cons=
ole}')
>>                   port =3D parser.parse_port(console)
>> diff --git a/meta-arm/lib/oeqa/selftest/cases/runfvp.py b/meta-arm/lib=
/oeqa/selftest/cases/runfvp.py
>> index 46941ca9..2d2cdc80 100644
>> --- a/meta-arm/lib/oeqa/selftest/cases/runfvp.py
>> +++ b/meta-arm/lib/oeqa/selftest/cases/runfvp.py
>> @@ -1,5 +1,6 @@
>>   import asyncio
>>   import os
>> +import json
>>   import pathlib
>>   import subprocess
>>   import tempfile
>> @@ -88,16 +89,20 @@ class RunnerTests(OESelftestTestCase):
>>           from fvp import runner
>>           with self.create_mock() as m:
>>               fvp =3D runner.FVPRunner(self.logger)
>> -            fvp.start({
>> -                "fvp-bindir": "/usr/bin",
>> -                "exe": "FVP_Binary",
>> -                "parameters": {'foo': 'bar'},
>> -                "data": ['data1'],
>> -                "applications": {'a1': 'file'},
>> -                "terminals": {},
>> -                "args": ['--extra-arg'],
>> -                "env": {"FOO": "BAR"}
>> -            })
>> +            config =3D {"fvp-bindir": "/usr/bin",
>> +                    "exe": "FVP_Binary",
>> +                    "parameters": {'foo': 'bar'},
>> +                    "data": ['data1'],
>> +                    "applications": {'a1': 'file'},
>> +                    "terminals": {},
>> +                    "args": ['--extra-arg'],
>> +                    "env": {"FOO": "BAR"}
>> +                     }
>> +
>> +            with tempfile.NamedTemporaryFile('w') as fvpconf:
>> +                json.dump(config, fvpconf)
>> +                fvpconf.flush()
>> +                fvp.start(fvpconf.name)
>>
>>               m.assert_called_once_with(['/usr/bin/FVP_Binary',
>>                   '--parameter', 'foo=3Dbar',
>> @@ -114,16 +119,20 @@ class RunnerTests(OESelftestTestCase):
>>           from fvp import runner
>>           with self.create_mock() as m:
>>               fvp =3D runner.FVPRunner(self.logger)
>> -            fvp.start({
>> -                "fvp-bindir": "/usr/bin",
>> -                "exe": "FVP_Binary",
>> -                "parameters": {},
>> -                "data": [],
>> -                "applications": {},
>> -                "terminals": {},
>> -                "args": [],
>> -                "env": {"FOO": "BAR"}
>> -            })
>> +            config =3D {"fvp-bindir": "/usr/bin",
>> +                      "exe": "FVP_Binary",
>> +                      "parameters": {},
>> +                      "data": [],
>> +                      "applications": {},
>> +                      "terminals": {},
>> +                      "args": [],
>> +                      "env": {"FOO": "BAR"}
>> +                     }
>> +
>> +            with tempfile.NamedTemporaryFile('w') as fvpconf:
>> +                json.dump(config, fvpconf)
>> +                fvpconf.flush()
>> +                fvp.start(fvpconf.name)
>>
>>               m.assert_called_once_with(['/usr/bin/FVP_Binary'],
>>                   stdin=3Dunittest.mock.ANY,
>> diff --git a/scripts/runfvp b/scripts/runfvp
>> index e4b00abc..c2e536c8 100755
>> --- a/scripts/runfvp
>> +++ b/scripts/runfvp
>> @@ -14,7 +14,7 @@ logger =3D logging.getLogger("RunFVP")
>>   libdir =3D pathlib.Path(__file__).parents[1] / "meta-arm" / "lib"
>>   sys.path.insert(0, str(libdir))
>>
>> -from fvp import terminal, runner, conffile
>> +from fvp import terminal, runner
>>
>>   def parse_args(arguments):
>>       import argparse
>> @@ -49,12 +49,13 @@ def parse_args(arguments):
>>       logger.debug(f"FVP arguments: {fvp_args}")
>>       return args, fvp_args
>>
>> -def start_fvp(args, config, extra_args):
>> +def start_fvp(args, fvpconf, extra_args):
>>       fvp =3D runner.FVPRunner(logger)
>>       try:
>> -        fvp.start(config, extra_args, args.terminals)
>> +        fvp.start(fvpconf, extra_args, args.terminals)
>>
>>           if args.console:
>> +            config =3D fvp.getConfig()
>>               expected_terminal =3D config["consoles"].get("default")
>>               if expected_terminal is None:
>>                   logger.error("--console used but FVP_CONSOLE not set=
 in machine configuration")
>> @@ -87,9 +88,7 @@ def runfvp(cli_args):
>>           config_file =3D args.config
>>       else:
>>           config_file =3D conffile.find(args.config)
>> -    logger.debug(f"Loading {config_file}")
>> -    config =3D conffile.load(config_file)
>> -    start_fvp(args, config, extra_args)
>> +    start_fvp(args, config_file, extra_args)
>>
>>
>>   if __name__ =3D=3D "__main__":
>> --
>> 2.40.1
>>


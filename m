Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1651CC77B75
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 09:40:49 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.45434.1684316442520240035
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 17 May 2023 02:40:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=HQl5i1TI;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: peron.clem@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ac785015d7so4317081fa.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 17 May 2023 02:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684316440; x=1686908440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7FlsXiLohhEBoIHa+kRNrEiTjuXKnHLRY4NkVkr+3k4=;
        b=HQl5i1TICOl29aNXn95k20k//sKk8rliZkVKxwJvvBTcYEwADlcKdtf9XDx1Zm9PHq
         /P0+xlME0kQaU8t1NF9eebWvoylc0aeEwd1gPJKtMhOi2eeS5n/6tqdGCHipQvMofkHz
         7Yxdu4rLJT69ymD4OywFWVUTiPfu1iioQ9nMkG3NxQrjgekqq418tnBis5eLG3m4rbJP
         xT/SdCRA38nPrSqmz+q2z3MNW4qmSDE7j+x3NuO2ulrbivCnC3OwniP/6qf3U5lC9Vt0
         VT68Lj16PW/uKxmCz1zk8rnemHZfV3tWpMEkhh5VIH/KOhQYXrOvDkabjVJ6K5Ru4Q0d
         qvMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684316440; x=1686908440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7FlsXiLohhEBoIHa+kRNrEiTjuXKnHLRY4NkVkr+3k4=;
        b=OYHFsnSvLPUyaLGLyQI8QxKRCx6XdZcoiGEl71oEEHqTM76nNZsZfK4WpDvlfmVVUF
         UNCJfnYwk/MxiaRYNbvnikYO7anrpleRwIz5C8eN4qofkjP//T8wYo/V7EhLTwzP5/bN
         0pCo8lRs4YReR+nf3Vk02ZBdKvFmtC5TfKA1DAqoUsV342Y1aBMzwG6w8xah6jE4jKI7
         NrFe9j87jn54sY8IM5YytatI4v58DQasvFZP/qmUDu5LRhcEgm1VIASj6U/lZIC4t/Yo
         FUZ0gNhKq53eY0o/JkGDsvUo8y0CX+Ld4086siA4Lj3SluN2LcscPhEetg5YDAtyHeLt
         il4g==
X-Gm-Message-State: AC+VfDzoA4jSG8+HRnvIeYRFsMtzb49eK05/BsElEH9qWYZwCOFTXEOs
	rQq5CFzOjqJRvqj8pr3zfZiYPx/fDWFfClxW1PU=
X-Google-Smtp-Source: ACHHUZ6F47PjygBZVZRuVyV98ObhXty2AUBWQbDd/GKZZVsRX7s5SGrmvJKZkx5kqcb5d/QgwARqA8R+UVPg1LjQum8=
X-Received: by 2002:a05:6512:4c8:b0:4f2:5f5f:e5c3 with SMTP id
 w8-20020a05651204c800b004f25f5fe5c3mr42277lfq.37.1684316440181; Wed, 17 May
 2023 02:40:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230408081158.7575-1-peron.clem@gmail.com> <ZDRhpmekJ1gYxnvq@kudzu.us>
In-Reply-To: <ZDRhpmekJ1gYxnvq@kudzu.us>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Wed, 17 May 2023 11:40:28 +0200
Message-ID: <CAJiuCcfcdg+asyuvYbiG6H0d+xx+Dr2G4AoN8VJChePdCkE-tQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] arm/lib: pass the PATH to fvp runner
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 17 May 2023 09:40:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4658

Hi Jon,

On Mon, 10 Apr 2023 at 21:21, Jon Mason <jdmason@kudzu.us> wrote:
>
> On Sat, Apr 08, 2023 at 10:11:57AM +0200, Cl=C3=A9ment P=C3=A9ron wrote:
> > When running an FVP machine the model executable need to be found
> > in the PATH environement.
> >
> > At the moment the script doesn't provide any PATH to the subprocess.
> >
> > Add PATH to the allowed environement variable to be forwaded.
> >
> > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > ---
> >  meta-arm/lib/fvp/runner.py                 | 2 +-
> >  meta-arm/lib/oeqa/selftest/cases/runfvp.py | 4 ++--
> >  2 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta-arm/lib/fvp/runner.py b/meta-arm/lib/fvp/runner.py
> > index c52cdc1c..d957e780 100644
> > --- a/meta-arm/lib/fvp/runner.py
> > +++ b/meta-arm/lib/fvp/runner.py
> > @@ -91,7 +91,7 @@ class FVPRunner:
> >          # Pass through environment variables needed for GUI applicatio=
ns, such
> >          # as xterm, to work.
> >          env =3D config['env']
> > -        for name in ('DISPLAY', 'WAYLAND_DISPLAY', 'XAUTHORITY'):
> > +        for name in ('DISPLAY', 'PATH', 'WAYLAND_DISPLAY', 'XAUTHORITY=
'):
> >              if name in os.environ:
> >                  env[name] =3D os.environ[name]
> >
> > diff --git a/meta-arm/lib/oeqa/selftest/cases/runfvp.py b/meta-arm/lib/=
oeqa/selftest/cases/runfvp.py
> > index 5cc8660f..7e0d7808 100644
> > --- a/meta-arm/lib/oeqa/selftest/cases/runfvp.py
> > +++ b/meta-arm/lib/oeqa/selftest/cases/runfvp.py
> > @@ -108,7 +108,7 @@ class RunnerTests(OESelftestTestCase):
> >                  stderr=3Dunittest.mock.ANY,
> >                  env=3D{"FOO":"BAR"})
>
> This is failing CI selftest on the line above.  You can see the error
> at https://gitlab.com/jonmason00/meta-arm/-/jobs/4087128645
> If I add a wildcard-like change for PATH to the env, everything is
> happy.  For example:
> -                env=3D{"FOO":"BAR"})
> +                env=3D{"FOO":"BAR", "PATH" : unittest.mock.ANY })
>
> I'm not sure it is a valid way to test this, as I think it ignores
> your hacking of the paths to test it.  Since PATH is always in the env
> now, there is no other way to get around it being present but not
> matching what we expect.  I'm hoping someone has a better way than
> ignoring it.
>
> Thoughts?  Anyone?

I will resend a version with the os.environ mocked.

Regards,
Clement


>
> Thanks,
> Jon
>
>
> >
> > -    @unittest.mock.patch.dict(os.environ, {"DISPLAY": ":42", "WAYLAND_=
DISPLAY": "wayland-42"})
> > +    @unittest.mock.patch.dict(os.environ, {"DISPLAY": ":42", "WAYLAND_=
DISPLAY": "wayland-42", "PATH": "/path-42:/usr/sbin:/usr/bin:/sbin:/bin"})
> >      def test_env_passthrough(self):
> >          from fvp import runner
> >          with self.create_mock() as m:
> > @@ -128,4 +128,4 @@ class RunnerTests(OESelftestTestCase):
> >                  stdin=3Dunittest.mock.ANY,
> >                  stdout=3Dunittest.mock.ANY,
> >                  stderr=3Dunittest.mock.ANY,
> > -                env=3D{"DISPLAY":":42", "FOO": "BAR", "WAYLAND_DISPLAY=
": "wayland-42"})
> > +                env=3D{"DISPLAY":":42", "FOO": "BAR", "WAYLAND_DISPLAY=
": "wayland-42", "PATH": "/path-42:/usr/sbin:/usr/bin:/sbin:/bin"})
> > --
> > 2.34.1
> >
> >


Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56849C6FD18
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 12:03:05 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web11.22630.1680091382825422316
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 29 Mar 2023 05:03:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QLCzB/C1;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: peron.clem@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id oe8so11342030qvb.6
        for <meta-arm@lists.yoctoproject.org>; Wed, 29 Mar 2023 05:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680091382;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dtGlim2lZAn3rjYBlzU9Mqf/zCGsXhYLRIS/o4EqWAw=;
        b=QLCzB/C1Q7/YvD3RYpf90WMRbl1JPzouDnIqX13BxNBIOkxylTbdcH47H6xm97iJSb
         LGT15xXJf86GKG4LWf+VlQ3VjaVKklimoHejDiFFKfdA3gGPOymLtrCkwVHunJQ2KENd
         tRnGKZqfavPn0d+g1UMhfoVnaIXRJ4sgEuyEolIQWIKbpk1ZZhpqOwyCZ0sMoRwDOjEn
         MIE2z6ITVxaZ5lptiHEuz7Z9RLzQ9NKd2nEfSIh3VzHSyqFknGTIx1tJXvSUMgiZWbfn
         CoBUR5NncOx30Pwv4HnYo8vlZ+njA6uFng/yh5qs5sKaNPeOUET34bdxgmZ0gIIvwwU7
         i6qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680091382;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dtGlim2lZAn3rjYBlzU9Mqf/zCGsXhYLRIS/o4EqWAw=;
        b=11w0YBmsW17q8dEtHvPgvZGpeUmGzVQ5mbJs21cZAnxng2T2yzGIzVIMqHPw5qePjN
         TAD6WGje6xIpMpL6jnUYAL99s6JBPMjNpqi8U6JUCANiWRgx30OF8AxnLJiKOieNiiyc
         MwiQPNx98RWFn4VN35GW+Vd6lydKWC+Q/BoPQaNWepF64sk6GmBcKig6z3vPsL1kc3ip
         0XPu51tmVJg/svY0ysFBaaVLAQNWyR5LZrXnUKHGX8yN5Qhv5psWcKTrbLw/SA4Sqw+G
         sARibh1n9ZcEXgkVXG9Pgkm8/vffKRnptmzjcviKrh27N31uXEwe4Ev2pjIO6ISFxRTb
         s/3w==
X-Gm-Message-State: AAQBX9dS+7oUf/WTI+lzupSujUHLKchGVisNlgV3TDZtQW5Cka65Yspy
	wSM2AJDDo+Qn1e+GypRXrRKaq2rPe47HfLX3fpU=
X-Google-Smtp-Source: AKy350ZbYmiujg1dqhVkZcAj4wJo1KP32HKhhbTL+HNwfmmjWLFNOXfg6jXf519+oMcej4XokJGebjqvIcKRMK6gvDk=
X-Received: by 2002:a05:6214:970:b0:5ad:953f:3bcd with SMTP id
 do16-20020a056214097000b005ad953f3bcdmr3297164qvb.7.1680091381637; Wed, 29
 Mar 2023 05:03:01 -0700 (PDT)
MIME-Version: 1.0
References: <1750E21A8E7AA843.29160@lists.yoctoproject.org>
In-Reply-To: <1750E21A8E7AA843.29160@lists.yoctoproject.org>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Wed, 29 Mar 2023 14:02:50 +0200
Message-ID: <CAJiuCce8Q7KjiLewZeB+mrJXRA8ZV_5B7aXdhtaaqHhiDVwe2Q@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 1/2] arm/lib: pass the PATH to fvp runner
To: peron.clem@gmail.com
Cc: meta-arm@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000fe251e05f808c1ed"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 29 Mar 2023 12:03:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4497

--000000000000fe251e05f808c1ed
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, 29 Mar 2023 at 14:01, Cl=C3=A9ment P=C3=A9ron via lists.yoctoprojec=
t.org
<peron.clem=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> When running an FVP machine the model executable need to be found
> in the PATH environement.

I'm trying to execute the FVP machine in Docker that will install the FVP
in a location which is different from the builder machine.

Hope it makes sense
Regards,
Clement

>
> At the moment the script doesn't provide any PATH to the subprocess.
>
> Add PATH to the allowed environement variable to be forwaded.
>
> Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> ---
>  meta-arm/lib/fvp/runner.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-arm/lib/fvp/runner.py b/meta-arm/lib/fvp/runner.py
> index 28351a39..40ad1f3c 100644
> --- a/meta-arm/lib/fvp/runner.py
> +++ b/meta-arm/lib/fvp/runner.py
> @@ -63,7 +63,7 @@ class FVPRunner:
>          # Pass through environment variables needed for GUI
applications, such
>          # as xterm, to work.
>          env =3D config['env']
> -        for name in ('DISPLAY', 'WAYLAND_DISPLAY'):
> +        for name in ('DISPLAY', 'PATH', 'WAYLAND_DISPLAY'):
>              if name in os.environ:
>                  env[name] =3D os.environ[name]
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#4495):
https://lists.yoctoproject.org/g/meta-arm/message/4495
> Mute This Topic: https://lists.yoctoproject.org/mt/97926508/4240582
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [
peron.clem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--000000000000fe251e05f808c1ed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br><br>On Wed, 29 Mar 2023 at 14:01, Cl=C3=A9ment P=C3=
=A9ron via <a href=3D"http://lists.yoctoproject.org">lists.yoctoproject.org=
</a> &lt;peron.clem=3D<a href=3D"mailto:gmail.com@lists.yoctoproject.org">g=
mail.com@lists.yoctoproject.org</a>&gt; wrote:<br>&gt;<br>&gt; When running=
 an FVP machine the model executable need to be found<br>&gt; in the PATH e=
nvironement.<div><br></div><div>I&#39;m trying to execute the FVP machine i=
n Docker that will install the FVP=C2=A0</div><div>in a location which is d=
ifferent from the builder machine.</div><div><br></div><div>Hope it makes s=
ense</div><div>Regards,</div><div>Clement</div><div><span style=3D"font-fam=
ily:Arial,Helvetica,sans-serif"><br></span></div><div><span style=3D"font-f=
amily:Arial,Helvetica,sans-serif">&gt;</span></div><div>&gt; At the moment =
the script doesn&#39;t provide any PATH to the subprocess.<br>&gt;<br>&gt; =
Add PATH to the allowed environement variable to be forwaded.<br>&gt;<br>&g=
t; Signed-off-by: Cl=C3=A9ment P=C3=A9ron &lt;<a href=3D"mailto:peron.clem@=
gmail.com">peron.clem@gmail.com</a>&gt;<br>&gt; ---<br>&gt; =C2=A0meta-arm/=
lib/fvp/runner.py | 2 +-<br>&gt; =C2=A01 file changed, 1 insertion(+), 1 de=
letion(-)<br>&gt;<br>&gt; diff --git a/meta-arm/lib/fvp/runner.py b/meta-ar=
m/lib/fvp/runner.py<br>&gt; index 28351a39..40ad1f3c 100644<br>&gt; --- a/m=
eta-arm/lib/fvp/runner.py<br>&gt; +++ b/meta-arm/lib/fvp/runner.py<br>&gt; =
@@ -63,7 +63,7 @@ class FVPRunner:<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0# Pass through environment variables needed for GUI applications, such<b=
r>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# as xterm, to work.<br>&gt; =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env =3D config[&#39;env&#39;]<br>&gt; - =C2=
=A0 =C2=A0 =C2=A0 =C2=A0for name in (&#39;DISPLAY&#39;, &#39;WAYLAND_DISPLA=
Y&#39;):<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0for name in (&#39;DISPLAY&#39=
;, &#39;PATH&#39;, &#39;WAYLAND_DISPLAY&#39;):<br>&gt; =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0if name in os.environ:<br>&gt; =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env[name] =3D os.environ[na=
me]<br>&gt;<br>&gt; --<br>&gt; 2.34.1<br>&gt;<br>&gt;<br>&gt; -=3D-=3D-=3D-=
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>&gt; Links: You receive all messages se=
nt to this group.<br>&gt; View/Reply Online (#4495): <a href=3D"https://lis=
ts.yoctoproject.org/g/meta-arm/message/4495">https://lists.yoctoproject.org=
/g/meta-arm/message/4495</a><br>&gt; Mute This Topic: <a href=3D"https://li=
sts.yoctoproject.org/mt/97926508/4240582">https://lists.yoctoproject.org/mt=
/97926508/4240582</a><br>&gt; Group Owner: <a href=3D"mailto:meta-arm%2Bown=
er@lists.yoctoproject.org">meta-arm+owner@lists.yoctoproject.org</a><br>&gt=
; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-arm/unsub">=
https://lists.yoctoproject.org/g/meta-arm/unsub</a> [<a href=3D"mailto:pero=
n.clem@gmail.com">peron.clem@gmail.com</a>]<br>&gt; -=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-=3D-=3D-=3D-=3D-<br>&gt;<br></div></div>

--000000000000fe251e05f808c1ed--


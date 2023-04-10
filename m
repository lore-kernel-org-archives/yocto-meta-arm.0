Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3AEAC77B61
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 19:21:21 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web10.54816.1681154474614874151
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 10 Apr 2023 12:21:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=AZGlQkHU;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.177, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f177.google.com with SMTP id bl15so5015165qtb.10
        for <meta-arm@lists.yoctoproject.org>; Mon, 10 Apr 2023 12:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112; t=1681154473; x=1683746473;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AlCA6vJQLW6B7ZuWtdU57o/qZMEC2Hv6pWTWuF7TANU=;
        b=AZGlQkHUk5N5LtTWmvUjCEUfK6tvwSi2arPRmQcxI+gPCJslzahjfngJsbXgQT1YK4
         EX4gAfuE5p9rvAFibrdD4S/TRapJo6CdE6n2IdShKwHTeH7ycmUbH8DQIxgCcTTWAlHV
         Yo557dbxVn+nTQS6nMxExpryhHbnoFalyORVEdyjhhmVVBjsBuFCmt218XbWdN285rcf
         V+EXQGPNg0Vq47PUn0dQ85MVggesg0vqtU7lQol/bLmH0B6+b712tfAXdEPuhOCfmXHx
         zM63gjoMFv8c5klkiUO7bS/TOBPPwL3oZL2eSP2vpJV+MldJRdYH984YWRVfAHl60RKS
         fXZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681154473; x=1683746473;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AlCA6vJQLW6B7ZuWtdU57o/qZMEC2Hv6pWTWuF7TANU=;
        b=rZLFNNU//oQdyfYh4eS7HXlYT7jhbcdPZ+5+IIHYN1y+OkqbLcFxUicWBBbjeVefIj
         Ya4EgTbAGAxcI9292EaKQjMiiYb5P5tF7r55VP+bgVMp+UVu1Op4J0Au0Lu82KQ0yJpq
         ECq+Jhgmtw/nfJt2M5cn6/Uja2usPESlbFu52hYDMXOvviyB7RTVSMFUBDPTCzFJ+GZb
         2pOL9FXDbME0BtcVBXMnqjCvuXtrg1WoHoUVA2Vw0sPTyTZaEgX0jNSxMceqyBKN8GRx
         5stV1FWke6XjCY/laWqNNqfAXQacguK6IYk0etA0k2PQj61JpDKzaqQRwM9GAUg/yFlT
         ucRA==
X-Gm-Message-State: AAQBX9c6UyDVyOtvuOSWOmwjOJk2S8fqH0JQSgMK11JbXI56f+LWSXFx
	mKh6ltuGebe+Q68ngPvoh+/C5Q==
X-Google-Smtp-Source: AKy350bF+bnVyT20Xx1ImNKhKAZoDzyX6CMC/f9FrPAyO/PEx0unIFVT9AunK1dIfiDL4niAj5u4ig==
X-Received: by 2002:ac8:5751:0:b0:3e3:8ed5:a470 with SMTP id 17-20020ac85751000000b003e38ed5a470mr21305124qtx.1.1681154473590;
        Mon, 10 Apr 2023 12:21:13 -0700 (PDT)
Received: from kudzu.us ([2605:a601:a600:7900:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id i14-20020ac8488e000000b003d5aae2182dsm3170069qtq.29.2023.04.10.12.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 12:21:12 -0700 (PDT)
Date: Mon, 10 Apr 2023 15:21:10 -0400
From: Jon Mason <jdmason@kudzu.us>
To: =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [PATCH v3 1/2] arm/lib: pass the PATH to fvp runner
Message-ID: <ZDRhpmekJ1gYxnvq@kudzu.us>
References: <20230408081158.7575-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230408081158.7575-1-peron.clem@gmail.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 10 Apr 2023 19:21:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4571

On Sat, Apr 08, 2023 at 10:11:57AM +0200, Cl�ment P�ron wrote:
> When running an FVP machine the model executable need to be found
> in the PATH environement.
> 
> At the moment the script doesn't provide any PATH to the subprocess.
> 
> Add PATH to the allowed environement variable to be forwaded.
> 
> Signed-off-by: Cl�ment P�ron <peron.clem@gmail.com>
> ---
>  meta-arm/lib/fvp/runner.py                 | 2 +-
>  meta-arm/lib/oeqa/selftest/cases/runfvp.py | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-arm/lib/fvp/runner.py b/meta-arm/lib/fvp/runner.py
> index c52cdc1c..d957e780 100644
> --- a/meta-arm/lib/fvp/runner.py
> +++ b/meta-arm/lib/fvp/runner.py
> @@ -91,7 +91,7 @@ class FVPRunner:
>          # Pass through environment variables needed for GUI applications, such
>          # as xterm, to work.
>          env = config['env']
> -        for name in ('DISPLAY', 'WAYLAND_DISPLAY', 'XAUTHORITY'):
> +        for name in ('DISPLAY', 'PATH', 'WAYLAND_DISPLAY', 'XAUTHORITY'):
>              if name in os.environ:
>                  env[name] = os.environ[name]
>  
> diff --git a/meta-arm/lib/oeqa/selftest/cases/runfvp.py b/meta-arm/lib/oeqa/selftest/cases/runfvp.py
> index 5cc8660f..7e0d7808 100644
> --- a/meta-arm/lib/oeqa/selftest/cases/runfvp.py
> +++ b/meta-arm/lib/oeqa/selftest/cases/runfvp.py
> @@ -108,7 +108,7 @@ class RunnerTests(OESelftestTestCase):
>                  stderr=unittest.mock.ANY,
>                  env={"FOO":"BAR"})

This is failing CI selftest on the line above.  You can see the error
at https://gitlab.com/jonmason00/meta-arm/-/jobs/4087128645
If I add a wildcard-like change for PATH to the env, everything is
happy.  For example:
-                env={"FOO":"BAR"})
+                env={"FOO":"BAR", "PATH" : unittest.mock.ANY })

I'm not sure it is a valid way to test this, as I think it ignores
your hacking of the paths to test it.  Since PATH is always in the env
now, there is no other way to get around it being present but not
matching what we expect.  I'm hoping someone has a better way than
ignoring it.

Thoughts?  Anyone?

Thanks,
Jon


>  
> -    @unittest.mock.patch.dict(os.environ, {"DISPLAY": ":42", "WAYLAND_DISPLAY": "wayland-42"})
> +    @unittest.mock.patch.dict(os.environ, {"DISPLAY": ":42", "WAYLAND_DISPLAY": "wayland-42", "PATH": "/path-42:/usr/sbin:/usr/bin:/sbin:/bin"})
>      def test_env_passthrough(self):
>          from fvp import runner
>          with self.create_mock() as m:
> @@ -128,4 +128,4 @@ class RunnerTests(OESelftestTestCase):
>                  stdin=unittest.mock.ANY,
>                  stdout=unittest.mock.ANY,
>                  stderr=unittest.mock.ANY,
> -                env={"DISPLAY":":42", "FOO": "BAR", "WAYLAND_DISPLAY": "wayland-42"})
> +                env={"DISPLAY":":42", "FOO": "BAR", "WAYLAND_DISPLAY": "wayland-42", "PATH": "/path-42:/usr/sbin:/usr/bin:/sbin:/bin"})
> -- 
> 2.34.1
> 
> 


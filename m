Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 938D4C7619A
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 03:01:15 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web11.46062.1680231670365948800
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Mar 2023 20:01:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=pNzbOF8L;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.176, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f176.google.com with SMTP id t19so20491629qta.12
        for <meta-arm@lists.yoctoproject.org>; Thu, 30 Mar 2023 20:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112; t=1680231669;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IGaX0EjbXiSTE0HtFPWywMVOUxHfXohSfFl//tSQjZc=;
        b=pNzbOF8Lw38dB981pl4aYmPBkawCBm2PDRrfAAEAu+KNi+ED2OcHWahcEtyxiSNl0y
         XNaZ+L8BJ/WltOhTl4ylPnqFmuOH7RwbT3+cLhrdLoyWREunaEDK0aY3cWh/z+oGwSC2
         FQeW6FVO4RQ2+n8b6HkuZ8pN7Twm9F95Zg1RbFOk+XehYLWkIHSSictuUJa3WbAoQXsW
         hL9sJv7BVGhjO4NIWLBBwq6ebZLJTCXUoaGW1M76Fg1LT7xa0tSrFAu7PC2lj41v0mCg
         bQz9rK1GGhlAZGI0dKrBEc3jHSCKwY8DI043eEIh9CJucKTY/o+g11GPdR22dYrxCyrQ
         5gXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680231669;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IGaX0EjbXiSTE0HtFPWywMVOUxHfXohSfFl//tSQjZc=;
        b=azN0l9vrxVoz5FnWxVpP5mY3DHlBtGehhx1n7nADfMv1T13yXwjtdb7LV0P2WSyr7M
         dTJdiWTwpm9u5Auifa0OKbfhnol79GoDdk/0E+OFlHPwfZ+u2RJnDL5CT9p0GeqUYKc8
         Gb/ZahYAmj8f4VvCm4wgwv8HcecktD+aV9exRveLPPLnHOdcLPTgOUGOixy5bNFxcUaX
         iQ5kgDNGWkFBw+07LiFTlkmp5M7THSSk1Jwx57xWhp9edeWQVVeJxQtwJkqhDfp0PyM2
         xi1KZjwv7PEgNwu9/lGwaK0rQJvFCDrS1fZA+ARaKx7Y7esOqGBB+v+QFZG/9/bhPuzw
         CwPw==
X-Gm-Message-State: AAQBX9cQ0pAOqzxnFpZLO+EH+Q9ZJayPCfFUD2b3U5NVoxaEsjuooRd+
	zGe1giWgA0dniQ9rMA7l3DU3vg==
X-Google-Smtp-Source: AKy350b2yiaM/G/eyofBYeyehLmoW+QJUDqM7R3Xa5fsUctceqtjU/pg6ohuJvUeMWc8TC6+F3HLkw==
X-Received: by 2002:ac8:5bca:0:b0:3e4:d6cb:2e8f with SMTP id b10-20020ac85bca000000b003e4d6cb2e8fmr37812462qtb.30.1680231669406;
        Thu, 30 Mar 2023 20:01:09 -0700 (PDT)
Received: from kudzu.us ([2605:a601:a600:7900:15a6:cff9:108:de91])
        by smtp.gmail.com with ESMTPSA id d23-20020ac847d7000000b003e4e1ea3cb5sm315273qtr.51.2023.03.30.20.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 20:01:09 -0700 (PDT)
Date: Thu, 30 Mar 2023 23:01:07 -0400
From: Jon Mason <jdmason@kudzu.us>
To: =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [PATCH 1/2] arm/lib: pass the PATH to fvp runner
Message-ID: <ZCZM88HRz0zDSqUk@kudzu.us>
References: <20230329120057.58949-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230329120057.58949-1-peron.clem@gmail.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 31 Mar 2023 03:01:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4522

On Wed, Mar 29, 2023 at 02:00:56PM +0200, Cl�ment P�ron wrote:
> When running an FVP machine the model executable need to be found
> in the PATH environement.
> 
> At the moment the script doesn't provide any PATH to the subprocess.
> 
> Add PATH to the allowed environement variable to be forwaded.
> 
> Signed-off-by: Cl�ment P�ron <peron.clem@gmail.com>

This patch doesn't apply cleanly to the master branch.  I think it's
as simple as appending to the list of variables passed to the
environment, but I'll leave it to you to confirm and test.

Thanks,
Jon

> ---
>  meta-arm/lib/fvp/runner.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arm/lib/fvp/runner.py b/meta-arm/lib/fvp/runner.py
> index 28351a39..40ad1f3c 100644
> --- a/meta-arm/lib/fvp/runner.py
> +++ b/meta-arm/lib/fvp/runner.py
> @@ -63,7 +63,7 @@ class FVPRunner:
>          # Pass through environment variables needed for GUI applications, such
>          # as xterm, to work.
>          env = config['env']
> -        for name in ('DISPLAY', 'WAYLAND_DISPLAY'):
> +        for name in ('DISPLAY', 'PATH', 'WAYLAND_DISPLAY'):
>              if name in os.environ:
>                  env[name] = os.environ[name]
>  
> -- 
> 2.34.1
> 
> 


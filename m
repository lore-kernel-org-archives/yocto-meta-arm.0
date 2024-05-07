Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 653AFC10F1A
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 18:21:40 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web10.1588.1715106099059432695
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 07 May 2024 11:21:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=rAaLQZA9;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.181, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-43d2277d7e1so13458141cf.1
        for <meta-arm@lists.yoctoproject.org>; Tue, 07 May 2024 11:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1715106098; x=1715710898; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jt64bE/6lpxYRre6fE3oTeZ4fu4YWjZ6tTTyoTfG/Rc=;
        b=rAaLQZA9OqKhFPuuPYggu6C/RjjxBGH+cGfbrXYN3wx3g2xF40k3wZzP45IJMJkavC
         AQxHs4vc7pK61zdEUUS10/0pO0/FOXoBKX7uXXnkmZd/pBRMkqWm4cJqZ+pCmiBHzVr5
         FMPJCMIns7rVB49UUg5xuClEHy6MQWS2X2u6fAsMXcT7xbKu3acK3nhNP+sjUymBxuW6
         cSVnnAHULcBB4A1LlNkcV09ZlHDqfNthSLol/JdEuhViwEvm1E8sCrro0lYWa9HMYK0L
         hQ1UNsPh0vTiOcjnxnA2FO6UbTSLfL0SAxTmGJVViWQVu0UBwhV16gTBNjLkb0lkPfuH
         TjIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715106098; x=1715710898;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jt64bE/6lpxYRre6fE3oTeZ4fu4YWjZ6tTTyoTfG/Rc=;
        b=lUwb4YebBKZuZpdQDENQ4lhwEotiMJe79KME92d2lomV5QIsHQIWhk9fw7dAhY4SHw
         nDCK82b81mFgwF142P0rN9hpJ1pZkxm1WgihNDjBwUXk+mjN9ohgjQiHhHU5MMjyXX9p
         AYCICcZyJZdDB+DFTiq0hHyswepOFfGZvRaImR2G5K11zH7TqBOypdXSCRwG9imj7tUF
         hsBUlZATg4ZFfslhFvDAFpxwPqJUb5Q1tnBz2MkvnMN1eGom1vV0FWzCdvnzOQmlj3rN
         SH/XQfl2BwVzHT0JtEvGxT+xk/y9C/e70ojFPZ7xDrlvkd3WlRgZLDw+PEn2/K4PEkYY
         EPYg==
X-Gm-Message-State: AOJu0Yz+C4q7Jte9zWF+nGcV8JkiocwK5oDi5Emc+0lIueA60FNnd8VW
	rysLC07HIWEds8xhnggIp38nVDBaOB3/jkY006K7RtGYRUTShWaS87tnNKYYwBM2eOu9cqURsbc
	=
X-Google-Smtp-Source: AGHT+IHfwGGzBJozpQJIKOFNDxREc0P7bhpbBBkzamIDQ2XWwfa+hBatePsRQP5TxG09SqxTvZRdLg==
X-Received: by 2002:ac8:7d54:0:b0:43a:ef50:e6f1 with SMTP id d75a77b69052e-43dbed39dddmr5057511cf.33.1715106098099;
        Tue, 07 May 2024 11:21:38 -0700 (PDT)
Received: from kudzu.us ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id p16-20020ac84090000000b0043ae36dc25bsm6667502qtl.80.2024.05.07.11.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 11:21:37 -0700 (PDT)
Date: Tue, 7 May 2024 14:21:36 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Jon Mason <jon.mason@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [PATCH 6/6] arm/oeqa: increase optee test timeout
Message-ID: <ZjpxMOWWTU2y4+qs@kudzu.us>
References: <20240507173313.50788-1-jon.mason@arm.com>
 <20240507173313.50788-6-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240507173313.50788-6-jon.mason@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 07 May 2024 18:21:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5704

On Tue, May 07, 2024 at 01:33:13PM -0400, Jon Mason wrote:
> OPTEE tests are failing in CI on slower systems due to timing out, but
> actually finish when given enough time to complete.  Increase the
> timeout value to be roughly 100 seconds longer than the time it is
> currently taking to finish on the slower systems.
> 
> Signed-off-by: Jon Mason <jon.mason@arm.com>

This should have:
Fixes: d4507866677c ("oeqa runtime: add optee.py test")

Since it is trivial, I'm just going to add to the commit manually
(instead of pushing a v2 for just this).

Thanks,
Jon

> ---
>  meta-arm/lib/oeqa/runtime/cases/optee.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arm/lib/oeqa/runtime/cases/optee.py b/meta-arm/lib/oeqa/runtime/cases/optee.py
> index 0a0bc31ed3d8..73bb3894e106 100644
> --- a/meta-arm/lib/oeqa/runtime/cases/optee.py
> +++ b/meta-arm/lib/oeqa/runtime/cases/optee.py
> @@ -12,7 +12,7 @@ class OpteeTestSuite(OERuntimeTestCase):
>      """
>      Run OP-TEE tests (xtest).
>      """
> -    @OETimeout(800)
> +    @OETimeout(1100)
>      @OEHasPackage(['optee-test'])
>      def test_opteetest_xtest(self):
>          # clear storage before executing tests
> @@ -20,5 +20,5 @@ class OpteeTestSuite(OERuntimeTestCase):
>          status, output = self.target.run(cmd, timeout=60)
>          self.assertEqual(status, 0, msg='\n'.join([cmd, output]))
>          cmd = "xtest"
> -        status, output = self.target.run(cmd, timeout=600)
> +        status, output = self.target.run(cmd, timeout=1000)
>          self.assertEqual(status, 0, msg='\n'.join([cmd, output]))
> -- 
> 2.39.3 (Apple Git-146)
> 
> 


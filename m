Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web09.35290.1605536589450168571
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 16 Nov 2020 06:23:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=awqqcAqc;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.177, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f177.google.com with SMTP id 11so16860843qkd.5
        for <meta-arm@lists.yoctoproject.org>; Mon, 16 Nov 2020 06:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=sGbz79yNNlNZNDDiVI+yW6+I1xOuFLI8zWX016fdK4I=;
        b=awqqcAqctJtzauylxOZ0uDLAVjeU+91GGv7quwgw3yjsYSf4YNeKwW4uASDn8kOPUf
         maeh3G+GGYBpwgnjHKc2K73N3B0noqFYioXpmMsHf8QTogdSfL9MLyHydAX32Ve3ZQjs
         POoUjQiRpxV0Ua1Nb1GmBCE2PfDZf0uRjggUSeudDebGKddNyGi4kSB175dM71yWRQ/x
         CACykclDkexcmxPIsZOG6L2BfX0Ci8lV/HzFZi8NOyJ9pcW+cVYbgMjnGL2r0P531xsW
         E9/PJJJKyst8SLMXTgl9njBctyf3xn9ZYIqm8oCxnx15MDyask0oFTSJaGDbA9rrYX1u
         j53g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=sGbz79yNNlNZNDDiVI+yW6+I1xOuFLI8zWX016fdK4I=;
        b=bTzAtIvHP/yJIAxuJ7Rd5gPI2yQ8JJWMSViGKGiTrPJzvYC8Cx2jBPEnRvwjEJI+C9
         KflevGGpwPU3vTaShGNiydQqDjC4Ta6CnLg8h20An2Zi/MeNqiI91BtIW+KFuyk6KVIy
         VzulAwCWTJ6PE0L2CNEplPco0cGd56W2sWnKVnxHn+HzJp3KQZBUg0Op4lHWMmgeXI++
         sCfwoYeuSmBUj1aU9Aj0Ai1gH4Xp/Kvs9CYg4vxGTKy2r0QFiCxHqjxW52b/ZmD5rjfu
         4lVvZ5VWpWqnRtCB/oIukeqniDKPQMPjSTQFtq0SDyzs9wRycMzL9OEQRHb9x0ENdABZ
         zuJg==
X-Gm-Message-State: AOAM532mKbaN4x0FoYAmCxEUiwra6nyawxjKtnmgloh9wAAb6SAxK7Wz
	DdeKc/PKCbuSF9nKWYi+vIlmzA==
X-Google-Smtp-Source: ABdhPJwAjCsGsQn+IJn/ua68rE6zZq23McltSp6nj5vESInMX9yuLzfFKWtzKb1SYjm6luZyB8shsw==
X-Received: by 2002:a37:a481:: with SMTP id n123mr14634181qke.114.1605536585094;
        Mon, 16 Nov 2020 06:23:05 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:8d8f:f072:1037:de6f])
        by smtp.gmail.com with ESMTPSA id 72sm7235913qtg.69.2020.11.16.06.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 06:23:04 -0800 (PST)
Date: Mon, 16 Nov 2020 09:23:02 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Nathan Dunne <Nathan.Dunne@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH] arm-autonomy/arm-autonomy-host-image-minimal: Resolve guest path if symlink
Message-ID: <20201116142302.GA20627@kudzu.us>
References: <20201110134152.14805-1-Nathan.Dunne@arm.com>
MIME-Version: 1.0
In-Reply-To: <20201110134152.14805-1-Nathan.Dunne@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 10, 2020 at 01:41:52PM +0000, Nathan Dunne wrote:
> In ARM_AUTONOMY_HOST_IMAGE_EXTERN_GUESTS, remove fatal error if guest path
> is a symlink, and instead resolve using os.path.realpath.
> 
> Issue-Id: SCM-638
> Signed-off-by: Nathan Dunne <Nathan.Dunne@arm.com>
> Change-Id: Ic4fdd7ae03ed6bb6caa55e722b89114080c90f4c

Pulled into master.

Thanks,
Jon

> ---
>  .../images/arm-autonomy-host-image-minimal.bb            | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb b/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb
> index 188e31d..47a07cd 100644
> --- a/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb
> +++ b/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb
> @@ -106,7 +106,14 @@ python add_extern_guests () {
>          _, _, path, _, _, parm = bb.fetch.decodeurl(entry)
>          if 'guestname' in parm:
>              if os.path.islink(path):
> -                bb.fatal("Guest file is a symlink: " + path)
> +                realpath = os.path.realpath(path)
> +
> +                if not os.path.exists(realpath):
> +                    bb.fatal("ARM_AUTONOMY_HOST_IMAGE_EXTERN_GUESTS link does not resolve: " + path)
> +
> +                bb.note("Guest file is a symlink:\n " + path + "\nResolved to:\n " + realpath)
> +                path = realpath
> +
>              bb.utils.mkdirhier(guestdir)
>              dstname = parm['guestname']
>              # Add file extension if not there
> -- 
> 2.17.1
> 

> 
> 
> 


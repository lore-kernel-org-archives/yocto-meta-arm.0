Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.web10.6208.1592396108161040616
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 17 Jun 2020 05:15:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=Fj4RL//N;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.67, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f67.google.com with SMTP id er17so857628qvb.8
        for <meta-arm@lists.yoctoproject.org>; Wed, 17 Jun 2020 05:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=69ipb6jnG1N7tcChS9X1ecwC1qWiUgazq03PHz+C1PM=;
        b=Fj4RL//NolYOjC4aDVJdhe+7smBQsSPNjubY7t9CPx2gYleKPUbgehxAEwrRIT02U2
         wwLni1CJbkD7o4QU1qK8s+Cz0dic/coTG8X814lZauf35ouWI2s9/MBDl/zpGOvnuNR5
         LkyF6+dRk51N9Mf0ecGcZcYt53lypo2uPCedva4ztQY5HmviNFoxE+ccOgcTpYIsstrl
         QRYng7dh234fI1eSbGBEKXtI/4s/xl0lokO6X/km0YoIvacudR2jewU2mWDxqNNt4J0X
         /OTIGbEE36Fb7wqSnml2qQKFB6l6sTTMKtUtgpq2JE6vLxzXXuQu/M+88Shu+OGgsNhP
         PzzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=69ipb6jnG1N7tcChS9X1ecwC1qWiUgazq03PHz+C1PM=;
        b=oiV74BBP741vXLFgLq4IKxGFz1Z1KP38h88tdfADh4Rqf+y+mFzfhYZQ31LfeHI3C2
         AACwNo5K/fqpwllIpD6iApPzb+NOfPToXF8ktpy08qrj+Ev59UVIr2j5mu0NZ3VxlF5p
         vHDx5zSrWdDQTD7OSpz44e/j1QykzpNCcsMgt+SRh0JhANYFOww/XZyT6O6DgF3VSUSe
         qnNWjDBRIGjCDrp7hCp67SoqxYEI1hq0TvXTCLGrIRceuXlhzRGNq4ISdQGVeEELbd4P
         GYPcu3Dper+DSwozaYaGQ75MIEryxJbxZdVFjvQsA7e6IfU19Iv+JTHG11ok3YrB7Kyn
         odJQ==
X-Gm-Message-State: AOAM531r+AMxmgULnm2+N+T8B7YJOxtKRaEeQ3QYcGrl25U/BrI66thw
	KJj9iQD8iA4Zo/OAQvZurJM5n5y0dls=
X-Google-Smtp-Source: ABdhPJy3fhjYpI+8XHTYpd3GzE0kuyZcgOnPI6vF51xVn6cnNzbGDCkkmrdtbuP/pccD8mlLjUNMwg==
X-Received: by 2002:ad4:500c:: with SMTP id s12mr6744535qvo.155.1592396107280;
        Wed, 17 Jun 2020 05:15:07 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:94c6:6885:fd31:55fa])
        by smtp.gmail.com with ESMTPSA id p13sm18601537qtk.24.2020.06.17.05.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 05:15:06 -0700 (PDT)
Date: Wed, 17 Jun 2020 08:15:05 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 1/3] README: add Ross Burton as co-maintainer
Message-ID: <20200617121504.GB21297@kudzu.us>
References: <20200616141404.1046832-1-ross@burtonini.com>
MIME-Version: 1.0
In-Reply-To: <20200616141404.1046832-1-ross@burtonini.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 16, 2020 at 03:14:02PM +0100, Ross Burton wrote:
> From: Ross Burton <ross.burton@arm.com>
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>

Who are you again?  ;-)

Series applied to the master branch.

Thanks,
Jon

> ---
>  README.md | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/README.md b/README.md
> index 04c641d..8f56fce 100644
> --- a/README.md
> +++ b/README.md
> @@ -36,3 +36,4 @@ to reproduce the issue
>  Maintainer(s)
>  -------------
>  * Jon Mason <jon.mason@arm.com>
> +* Ross Burton <ross.burton@arm.com>
> -- 
> 2.26.2
> 

> 


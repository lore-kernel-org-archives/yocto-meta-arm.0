Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web10.2771.1601665260733610746
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 02 Oct 2020 12:01:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=1fgDso52;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.195, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f195.google.com with SMTP id f142so2717571qke.13
        for <meta-arm@lists.yoctoproject.org>; Fri, 02 Oct 2020 12:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+pTH6FTgArzBYikcM2ADQtEGzFVWdfRIpP31s3HWXNA=;
        b=1fgDso52q33xc4h+vbcHUHtHdA9Gc8FErpyvJ9Ju62zWZWpKQSa1p3xs1Y8mHKsJhJ
         5r+Ab+AdcxzrFkIQJW0CkNmhoGrAujk0Sy7Fvfi9t7K3rqDir0B5PqZSDWDAbV7KiBcZ
         DopsAxkL9D1ZHAMiUD3IR8W0U9mVihHI6PeDSfmz9y8B+nwuT1/1WoarzSI3gkV3h84Z
         1d19JVYbR2MneQYfLStwphvxwF669WLH0HQ3bAegnDH5TwOsn0pBpUR1JAjC1QfO/dGV
         ajGHhysGhl/QzUtE+lO+H+UdkVNbFCK1hazA8Di2H1G+p0gDnlIjqvPSY5VXSnIPUgo9
         B1Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+pTH6FTgArzBYikcM2ADQtEGzFVWdfRIpP31s3HWXNA=;
        b=fC+jXgvMoioAlmQr+l6qinqe78YnEMlUg4A+0wtW1CPCQ1ICYOBYhEbVxE/+HISkIa
         C3MIxhbDFSGMCztdKwgyt8u7RZfNOUg1c9KpKqdvPT7cbV+iQ68f9qbMzZ+t+BW9FpmS
         xas3hcjYHlqjEIJKzBdHVccTzanZCPTTO6lRwpS+JBk8XdpvIljkNCo8+qFOfbwU8S9u
         0Uqo0Y6Wq/yQJQ83X6mNmVxqGyT5wG9mHhq+MkM11i3YoUdgytQ9HTpJiPZD12vLF7xh
         4J+nJwNsw3kl50ICa7L2DuN90wW0zXs/nF5mc7+E9kKZwdUAzbPWAD0cHo1PjNsN1SGk
         8qfw==
X-Gm-Message-State: AOAM532acKenOxkJvHqcBN/etMuZ/XIj2V2kgX06IWBz4N5FVGGC1/vt
	KURNfBj+rKDSvCkKDxNZ5qOyrQ==
X-Google-Smtp-Source: ABdhPJytnbsCVzS8q8wsx+2FyNzCQM3+GP+TKyGYXE0d0xm42W0XthRhEdnE5szLhnG++p016xUGqw==
X-Received: by 2002:a05:620a:981:: with SMTP id x1mr3287838qkx.404.1601665259863;
        Fri, 02 Oct 2020 12:00:59 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id x9sm1652561qts.65.2020.10.02.12.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2020 12:00:59 -0700 (PDT)
Date: Fri, 2 Oct 2020 15:00:54 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH 1/2] arm-autonomy/grub-efi: Add xen_boot support when 'xen' is in DISTRO_FEATURES
Message-ID: <20201002190054.GA7831@kudzu.us>
References: <f01f29dba132ba93d6fc85f87257f2a581b1ee98.1601568289.git.diego.sueiro@arm.com>
MIME-Version: 1.0
In-Reply-To: <f01f29dba132ba93d6fc85f87257f2a581b1ee98.1601568289.git.diego.sueiro@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 01, 2020 at 05:06:49PM +0100, Diego Sueiro wrote:
> Change-Id: Icb9d909beae96e3915f36093c1c16859181d0238
> Issue-Id: SCM-1065
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>

Both patches applied to master.

Thanks,
Jon

> ---
>  meta-arm-autonomy/recipes-bsp/grub/grub-efi_%.bbappend | 1 +
>  1 file changed, 1 insertion(+)
>  create mode 100644 meta-arm-autonomy/recipes-bsp/grub/grub-efi_%.bbappend
> 
> diff --git a/meta-arm-autonomy/recipes-bsp/grub/grub-efi_%.bbappend b/meta-arm-autonomy/recipes-bsp/grub/grub-efi_%.bbappend
> new file mode 100644
> index 0000000..6d60011
> --- /dev/null
> +++ b/meta-arm-autonomy/recipes-bsp/grub/grub-efi_%.bbappend
> @@ -0,0 +1 @@
> +GRUB_BUILDIN += "${@bb.utils.contains('DISTRO_FEATURES', 'xen', 'xen_boot', '', d)}"
> -- 
> 2.7.4
> 

> 
> 
> 


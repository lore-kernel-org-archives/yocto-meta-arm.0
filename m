Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web10.35091.1605536730211539023
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 16 Nov 2020 06:25:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=SjYKlYcl;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.193, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f193.google.com with SMTP id j31so12901790qtb.8
        for <meta-arm@lists.yoctoproject.org>; Mon, 16 Nov 2020 06:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5Qs7L4NG/DEPyc8uPdY+wmhSLkEN7AHbzuM1jRsAhJo=;
        b=SjYKlYcliZsgR7G7fLgC5xIUgyEJdLfG5EBGoNNo1DqzLOGtkH8dZ2jAdpD9n+n3Wd
         kdhu7Xqcjt62ta89MVy23IdZpKzcMX4g4kXXBiI+9zyLADzwsyryApnQa6oncBA6/TTG
         pwvZ2hkFG/mT3NCfrvIxkiF6XpUHoE58iSK9/62EfjS7NG6TPQQppbAA9jJGyK7unsue
         8+419pqm+flCiJcf96jNkp/Oac+K4J8PeDlcR+l+t+9tF1ICFYQxmmlfCRA/R+G1qo8Z
         7vGJtpMtfVcjOuhb6EVsKWhkMDbd1e0TnH7sPOlnpltTYdILVACK/4odjJ6WFK5TOBDg
         iOzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5Qs7L4NG/DEPyc8uPdY+wmhSLkEN7AHbzuM1jRsAhJo=;
        b=ZSoOBezQ2PnDs/feeU+4pcdNsw3P0jocr3SYPfan5sTbgsu6cAGPVCUMJk5hvj0qmA
         BacBlrYviYhZrcdeLi7W8KfSuFWaU1emLVNtfoeJPCsCoZf2anycRYsTs+PiEKXY9uwa
         1UWPN8Q4HYYJGwGk2b2M19apZTb9C9H6d+w0kUuuoNK8HUnEqY4LoE3STbsrC3C74yMH
         bOCYqU1GBbp5liUAMG3ghcXheR/+yqDYd7EjOBbJQ4rb2be3pPDTCWi/lq9vnJJyq9Uo
         5GVjLmJyJiU1CWUe7K6nSJdoRbEOcgjK6jHwoQikkrXfFxhIWuF2lxwjlfE1vXJl/Zgm
         HoqA==
X-Gm-Message-State: AOAM531OrMcASHnAHkoZVPYSHuiKBWonl6UzXYovyl3LVV4aEUbXBe57
	bOFyIi8HZ1C4Pynv79oFZvJuAuOHe0OYIA==
X-Google-Smtp-Source: ABdhPJxh3Ry6Jc2PCf+kswcTlFiV0hi8csc9XU51VV3rFCLCEbg+whVT7iR3Y3h/x++B96LIjM6/Zg==
X-Received: by 2002:aed:3968:: with SMTP id l95mr14372828qte.302.1605536729368;
        Mon, 16 Nov 2020 06:25:29 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:8d8f:f072:1037:de6f])
        by smtp.gmail.com with ESMTPSA id s71sm5947653qka.102.2020.11.16.06.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 06:25:28 -0800 (PST)
Date: Mon, 16 Nov 2020 09:25:27 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Khasim Mohammed <khasim.mohammed@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH] arm-bsp/n1sdp: remove swap parition entry from wic image
Message-ID: <20201116142526.GC20627@kudzu.us>
References: <20201112150138.30489-1-khasim.mohammed@arm.com>
MIME-Version: 1.0
In-Reply-To: <20201112150138.30489-1-khasim.mohammed@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 12, 2020 at 08:31:38PM +0530, Khasim Mohammed wrote:
> The swap partition on n1sdp seem to create an issue when shutdown or reboot is run
> from the shell prompt, the console stops at "Deactivating swap ...". Hence
> removing the swap partition entry from wic image.
> 
> Change-Id: I22cf971fdde7e3b8b386c74003983fab3d309cc5
> Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>

Applied to master.

Thanks,
Jon

> ---
>  meta-arm-bsp/wic/n1sdp-efidisk.wks | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/meta-arm-bsp/wic/n1sdp-efidisk.wks b/meta-arm-bsp/wic/n1sdp-efidisk.wks
> index d1ebfb8..b131dd8 100644
> --- a/meta-arm-bsp/wic/n1sdp-efidisk.wks
> +++ b/meta-arm-bsp/wic/n1sdp-efidisk.wks
> @@ -6,6 +6,4 @@ part /boot --source bootimg-efi --sourceparams="loader=grub-efi" --ondisk sda --
>  
>  part / --source rootfs --ondisk sda --fstype=ext4 --label root --align 1024 --uuid=6a60524d-061d-454a-bfd1-38989910eccd
>  
> -part swap --ondisk sda --size 44 --label swap1 --fstype=swap
> -
>  bootloader --ptable gpt --configfile="n1sdp-grub.cfg" --timeout=5
> -- 
> 2.17.1
> 

> 
> 
> 


Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web08.10496.1605797992686512686
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 19 Nov 2020 06:59:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=elyaJPYp;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.193, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f193.google.com with SMTP id y197so5556302qkb.7
        for <meta-arm@lists.yoctoproject.org>; Thu, 19 Nov 2020 06:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=mXGJSmuTIS7N7yCdw2PfKW9Sc8KvUO+AXiSS6C36xBY=;
        b=elyaJPYp9Jb/Sx5dmLKsK6Fk/aEirLMEYS9ZDUE+MJ2FeOYTI6I2M4UStjtHrpUG5r
         bErjZxYz1fYiSZgJLQJY6JtcgdFJ/qvQgjijmI51U2aCzrXFXpzd4cpUf0/k5vmi0W55
         kktkUgPcLGVUNcj+SXw1cthfm3UDEfKXaqym3jLy4E4aDyG8KiVuAehXBE/CdXUDjbs7
         NTYPjL+Fn2r39dIVEjiBysQgYHTmFRv9e11ZZaw3wKdgKeJJJeaqZUtrB6awXRxNxtlM
         zqTZvcZTcfyhzjqaZpTk5v5eigXIsTiWEiGSFLdlVVaXh19prN+POg6T+GJQuzMRFizm
         yYPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mXGJSmuTIS7N7yCdw2PfKW9Sc8KvUO+AXiSS6C36xBY=;
        b=IUS++s3XLwqbsjsGJAWJF5YAwBVU7yVbhIIEP3X6wLa56DkPwwwbTj2Y/y00/ztyOU
         qhfZTfLS17f9+R9zE3P7v+pUMAqt1YKQbFMZyBFkG5DJF5foDxXcmB1/n9b96dY9aqui
         kG6QSBXAPNXqu6nZxSWP5COP05SdwO6Zah9ElJJ4c7N9qN4dDwUkyQN+RL4PklTgGjOE
         oeCRl5vDUyKcw3gw5rSQzsIBIA9Qtmuxhw1pQwwKgCdjvslDDXwmIoEVs/FEN4rHkAWn
         lksvoGpRk8rOkXnfwgxxeOwgXqTU68lTEGebebvFOzwFGuyxMurnpp7Ltzz1tFzpeDBx
         U3TA==
X-Gm-Message-State: AOAM530m876SVR86dUkVzgjocq4AK6DWtstYyWQPRg3tiR5q8DCTlKHZ
	6j+O5xKDe9EYpSXaWShGSmDBRQ==
X-Google-Smtp-Source: ABdhPJx3NXxEMt/XdJAmryQ6y+Sy2YAN1ID4RsTUjPqlTP1tGmqGb+pZqD4Xh9/EEIK0ixCtuV30hA==
X-Received: by 2002:a37:2d05:: with SMTP id t5mr11028639qkh.271.1605797991834;
        Thu, 19 Nov 2020 06:59:51 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:c9b6:920b:7215:8210])
        by smtp.gmail.com with ESMTPSA id y1sm12694003qky.63.2020.11.19.06.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 06:59:51 -0800 (PST)
Date: Thu, 19 Nov 2020 09:59:49 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Khasim Mohammed <Khasim.Mohammed@arm.com>
Cc: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>,
	nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH] arm-bsp/n1sdp: remove swap parition entry from wic image
Message-ID: <20201119145948.GD13793@kudzu.us>
References: <20201112150138.30489-1-khasim.mohammed@arm.com>
 <20201116142526.GC20627@kudzu.us>
 <DB7PR08MB34203A01535216DAF3987247FAE10@DB7PR08MB3420.eurprd08.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <DB7PR08MB34203A01535216DAF3987247FAE10@DB7PR08MB3420.eurprd08.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 18, 2020 at 02:52:34PM +0000, Khasim Mohammed wrote:
> Hi Jon,
> 
> ________________________________________
> From: Jon Mason <jdmason@kudzu.us>
> Sent: Monday, November 16, 2020 7:55 PM
> To: Khasim Mohammed
> Cc: meta-arm@lists.yoctoproject.org; nd
> Subject: Re: [meta-arm] [PATCH] arm-bsp/n1sdp: remove swap parition entry from wic image
> 
> On Thu, Nov 12, 2020 at 08:31:38PM +0530, Khasim Mohammed wrote:
> > The swap partition on n1sdp seem to create an issue when shutdown or reboot is run
> > from the shell prompt, the console stops at "Deactivating swap ...". Hence
> > removing the swap partition entry from wic image.
> >
> > Change-Id: I22cf971fdde7e3b8b386c74003983fab3d309cc5
> > Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
> 
> > Applied to master.
> 
> Can you please apply this patch to gatesgarth branch as well ?

Done

> 
> Thanks,
> Jon
> 
> > ---
> >  meta-arm-bsp/wic/n1sdp-efidisk.wks | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/meta-arm-bsp/wic/n1sdp-efidisk.wks b/meta-arm-bsp/wic/n1sdp-efidisk.wks
> > index d1ebfb8..b131dd8 100644
> > --- a/meta-arm-bsp/wic/n1sdp-efidisk.wks
> > +++ b/meta-arm-bsp/wic/n1sdp-efidisk.wks
> > @@ -6,6 +6,4 @@ part /boot --source bootimg-efi --sourceparams="loader=grub-efi" --ondisk sda --
> >
> >  part / --source rootfs --ondisk sda --fstype=ext4 --label root --align 1024 --uuid=6a60524d-061d-454a-bfd1-38989910eccd
> >
> > -part swap --ondisk sda --size 44 --label swap1 --fstype=swap
> > -
> >  bootloader --ptable gpt --configfile="n1sdp-grub.cfg" --timeout=5
> > --
> > 2.17.1
> >
> 
> >
> > 
> >
> 

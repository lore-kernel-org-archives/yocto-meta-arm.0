Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 895ACC4345F
	for <webhook@archiver.kernel.org>; Mon, 29 Apr 2024 13:54:28 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web10.21926.1714398864958064286
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 29 Apr 2024 06:54:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=RU2/PtWX;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.167.169, mailfrom: jdmason@kudzu.us)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3c750fd1202so2657033b6e.2
        for <meta-arm@lists.yoctoproject.org>; Mon, 29 Apr 2024 06:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1714398864; x=1715003664; darn=lists.yoctoproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZdulR79bMq0m2XQ0ntaeo8HYjcgtQ8fP1StPhT+2bOw=;
        b=RU2/PtWXiJztaWcdyXfIs1z8l2EhvDkZzTxd0wdeqW3aLwLvjH+k+MqPHSlSKSfVbd
         0s7A1X9iOjSscwMHrmXcXNUAzKfU0qw7UShk5jp4MUUGoLuJ6M9H2d7dz0q/mzdue3xm
         i1V0ElbNlvoiRIDaphfvJsnmecSDURDCbX5ugRBFqURCq/oavRUdQMDy8kxT/lljA3Yt
         0Ua1u5jjSFurrQyCAAglF+Bk3URGaABLVrntfUWNZ5gcqO1qIV6XZ5e++aVpzBuF8j/r
         IiEqZGkntXasauwGaLMl8MUW/k62jYBbasAbdynsqUJ1RogUhqnmJVy7NZ3ucexrwhQn
         drQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714398864; x=1715003664;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZdulR79bMq0m2XQ0ntaeo8HYjcgtQ8fP1StPhT+2bOw=;
        b=UnP9SChJ24kELfQ91hPt9Z4CnC6/j+oD4bQPvOGNZaOKKvZWQUsq2UEP0A4DE3JC8W
         7QoRcv3pARZj0qWHtjE31gc8dzoR+HbWE9D0cqscKpHQhcEOHnfpBcIWJVMPzGOQ1+Qw
         Tg6W6rT7sXxAstoFze8qE7Wx6K9kcPO7CWFzmWhouCLD68+ZrhQmSv2OdfojqVI8ZuPZ
         +C4cgpeBl+x5GEOYB9BHgihzQTtlJnoNAx1pOEomFINSD8cJec8wnkL+NAcH5nIe6yuo
         Gd24rLFNMYgr21OPuzFb1GGDW/aqSSGQcZy1poz6XcH4v6h8r9081uUSzvXlCGBDHHdX
         gO/A==
X-Forwarded-Encrypted: i=1; AJvYcCUo7m9NzLzfIJKZ/XRiYX2F5McHG7q6bIgJERvfVZkn/OESyQs98HHS2q5jQDOvz3eRBa7fuv3JKca/HQHpuumn29zkykzf5ysQJcQ21rW9
X-Gm-Message-State: AOJu0YywitNPV+5yvI5KafIvQse4lxaNWcfbomz8gsDcjkaOsZqHHEY7
	FNCI7H/paMet7ywtJtF0pjN86Xj1uq7vCSV6eAV+oAJkASAfqL8q0vYjwju30A==
X-Google-Smtp-Source: AGHT+IFlStZ7wqXhX2anogtewieG5wmW3YVG7RqqnrFMQDrFlWV4kOHl3+saI/CdvzFZfm/rwjMgCA==
X-Received: by 2002:a05:6808:4405:b0:3c6:f07a:bc4b with SMTP id eo5-20020a056808440500b003c6f07abc4bmr11250122oib.44.1714398864125;
        Mon, 29 Apr 2024 06:54:24 -0700 (PDT)
Received: from kudzu.us ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id bl14-20020a05620a1a8e00b00790f74b3814sm742510qkb.82.2024.04.29.06.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 06:54:23 -0700 (PDT)
Date: Mon, 29 Apr 2024 09:54:22 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Vasyl Vavrychuk <vvavrychuk@gmail.com>,
	Ross Burton <ross.burton@arm.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 2/3] external-arm-toolchain: in libc.so GNU ld
 script use base_libdir
Message-ID: <Zi+mjstvIGWi5o4f@kudzu.us>
References: <20240417113042.91880-1-vvavrychuk@gmail.com>
 <20240417113042.91880-3-vvavrychuk@gmail.com>
 <20240417201213.GU28791@denix.org>
 <CAGj4m+47gi6kai=_5ubCtqoz-Qis_uNgERLEn=Ho1otpH0pfRg@mail.gmail.com>
 <20240418155738.GY28791@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240418155738.GY28791@denix.org>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 29 Apr 2024 13:54:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5620

On Thu, Apr 18, 2024 at 11:57:38AM -0400, Denys Dmytriyenko wrote:
> On Thu, Apr 18, 2024 at 04:54:05PM +0300, Vasyl Vavrychuk wrote:
> > On Wed, Apr 17, 2024 at 11:12 PM Denys Dmytriyenko <denis@denix.org> wrote:
> > >
> > > On Wed, Apr 17, 2024 at 02:30:41PM +0300, Vasyl Vavrychuk wrote:
> > > > -             sed -i -e "s# /${EAT_LIBDIR}/${EAT_TARGET_SYS}# ../../${EAT_LIBDIR}#g" -e "s# /usr/${EAT_LIBDIR}/# /usr/lib/#g" -e "s# /usr/${EAT_LIBDIR}/${EAT_TARGET_SYS}# .#g" -e "s# /${EAT_LIBDIR}/ld-linux# ../../${EAT_LIBDIR}/ld-linux#g" ${D}${libdir}/libc.so
> > > > +             sed -i -e "s# /${EAT_LIBDIR}/${EAT_TARGET_SYS}# ../../${EAT_LIBDIR}#g" -e "s# /usr/${EAT_LIBDIR}/# /usr/lib/#g" -e "s# /usr/${EAT_LIBDIR}/${EAT_TARGET_SYS}# .#g" -e "s# /${EAT_LIBDIR}/ld-linux# ../../${base_libdir}/ld-linux#g" ${D}${libdir}/libc.so
> > >
> > > Here ^^^ it's not clear why only the last of the sed replacements gets
> > > updated, not all of them?
> > 
> > 1. `/${EAT_LIBDIR}/${EAT_TARGET_SYS}` path is not used in libc.so in
> > Arm GNU Toolchain v13.2.Rel1 in targets "arm-none-linux-gnueabihf" and
> > "aarch64-none-linux-gnu". I am not sure in which versions for ARM or
> > Linaro toolchain this path was used in libc.so. Should I replace it
> > blindly?
> 
> Yeah, this list has grown with different versions of the toolchain, where 
> almost every new version required a slightly different adjustment in the 
> past.
> 
> And the external toolchain recipe was always trying to be version agnostic 
> and work with a wide range of toolchain versions.
> 
> But I guess we could simplify the list of supported versions to what is 
> currently available for download - I see that 11.x and 12.x are supported 
> now. 
> 
> Can you please check if libc.so is the same in those versions? If so, we 
> can potentially drop all other sed mods from here. Thanks.

meta-arm is going to release very, very soon.  If this series should
go in, then this needs to get wrapped up ASAP.

Vasyl, can you check about libc.so (per Denys's question/comment
above, and possibly do another version if his suggestion is correct)? 

Thanks,
Jon

> 
> 
> > 2. Rest two expressions replace input string to "/usr/lib" or ".", so
> > they are not affected by usrmerge.
> 
> -- 
> Denys
> 


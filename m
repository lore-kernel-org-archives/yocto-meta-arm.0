Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6663ECAAA1
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 15:36:28 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web11.20663.1666625787523158098
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 24 Oct 2022 08:36:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=HuY1Od5x;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.174, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f174.google.com with SMTP id a5so6285956qkl.6
        for <meta-arm@lists.yoctoproject.org>; Mon, 24 Oct 2022 08:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EkhHiA3zKy06f2pyYLSrzBBOWDrwzclShsmNPtjDfAo=;
        b=HuY1Od5xDWxOgt7BOeorYKanjID2dL4OPHuF7NqwWYWzoiSvN0U9jm+zS9Pz3uRGFY
         6QFhe9QzdV36nRp4kQhVJpK2WEMZRCGfRGXBTe3AdOT6fWdG8E17nFrGUrNtrex5NioN
         TBywXlKU5DFewEHmG6LNhVFT7J2jAZO0DKd+lkidsc+UYMh5SXTD7fjQA2SUI7haPUBj
         xGoWyoJkFeT9th4xBzLEpi4nsGpUK8ibNsJCM6uES+R1/vod3IxVgUd1M9ZPVE7yR5XE
         ciCq1qLZBFYSJrRAoclJkR3MuXSOQ8CxfSy+YeMyPaHt9+Syq2a0ovJ6aG0+W3ME23Hz
         lpLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EkhHiA3zKy06f2pyYLSrzBBOWDrwzclShsmNPtjDfAo=;
        b=t/2MZ95ErKh9GhFGm717stGRqWD9zFHxv7pp5rd59JZzrxuC4Wg1fKl33OYJxLKVle
         ibrNg3UG4eKL7cUmbdguDa7HvfY9P30Iopx90ObPPxufv45XLh7tDSWUlxGsF9P5sgjD
         RJNr34vRIPXvtwppZ4n/Sb0/c4QPLYNmsNQqRlQKvp9Em7vp1QtnhGrYytumAHkVV4Tb
         qQ654KTeo2VLmhAQnQOLVgQYQwLX1JG4Vfjk4doQOLpvoMShikvmoklx5aKtwJjpY+2A
         qwZM4Pn4JfUAC7pOfWUlV5BhGA0hmFfUGyEnToOVcJReLCUbPDafdytew+4s7xa0Mh2G
         k6HQ==
X-Gm-Message-State: ACrzQf3LMD8EHRP8CmGtQHDfqW6RP9px+chg1T9/ubvkzDMHgjumIHyZ
	y9hTpmcQcmrGb3eoyIHXGMWGpZQYpG/Kww==
X-Google-Smtp-Source: AMsMyM55fhdlekkG45Rs5ExiK7bwm3Juka/OxMzG1RYOSpQ4+bmwZDV/BzxWhUe1Qkbm+bNa6spUzw==
X-Received: by 2002:ae9:f813:0:b0:6eb:44ba:c56f with SMTP id x19-20020ae9f813000000b006eb44bac56fmr22809452qkh.599.1666625786129;
        Mon, 24 Oct 2022 08:36:26 -0700 (PDT)
Received: from kudzu.us ([2605:a601:a608:5600:5336:1ccc:fa87:21b2])
        by smtp.gmail.com with ESMTPSA id s14-20020a05620a254e00b006cf8fc6e922sm118734qko.119.2022.10.24.08.36.25
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 08:36:25 -0700 (PDT)
Date: Mon, 24 Oct 2022 11:36:24 -0400
From: Jon Mason <jdmason@kudzu.us>
To: meta-arm@lists.yoctoproject.org
Subject: Re: meta-arm kirkstone update
Message-ID: <Y1aw+Akww0G5LTnf@kudzu.us>
References: <Y1au1otwUxr0iAFO@athena.kudzu.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1au1otwUxr0iAFO@athena.kudzu.us>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 24 Oct 2022 15:36:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4028

On Mon, Oct 24, 2022 at 11:27:18AM -0400, Jon Mason wrote:
> meta-arm has released an updated kirkstone support tag, 4.1.1.  The tag 
> contains 46 patches from between 03 May 2022 and 19 Oct 2022.
> 
> Per an external request, we have duplicated all existing "numbers only" 
> tags (i.e., 4.1.1) with a yocto-x.y.z tag (i.e., yocto-4.1.1).
> 
> Thanks,
> Jon
> 
This tag should've been 4.0.1.  Working on fixing it now.  Please
delete the 4.1.1 and yocto-4.1.1 tags if you happened to fetch them in
the past 15 mins.

Thanks,
Jon


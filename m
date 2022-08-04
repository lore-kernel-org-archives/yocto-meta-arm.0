Return-Path: <sumit.garg@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43D52C19F2A
	for <webhook@archiver.kernel.org>; Thu,  4 Aug 2022 13:07:25 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web08.4470.1659618441696908633
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 04 Aug 2022 06:07:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=o+rmHIIw;
 spf=pass (domain: linaro.org, ip: 209.85.219.179,
 mailfrom: sumit.garg@linaro.org)
Received: by mail-yb1-f179.google.com with SMTP id g5so8578315ybg.11
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 04 Aug 2022 06:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VIJEWHUWtTaZ3Z+pZVbDaC0ayC4WauwPW71czu2toyc=;
        b=o+rmHIIwbEv4g4qTkyjwarLpPT5W4s38/srh94VOSWtgS+A5i3P6WfqCCYyQKPq5h1
         1edARQq9n6d7SHitSFfcImcRp4WS5+bjc0vIYJw0qb2e7BnjSVRqosAzLxCNnzbar4Ug
         yaKeHRUbQvwRQ6M/vyiSvOhPkiHk1VeHl4sEZFeuycxDMGmoR8pCuo8hrx6IBzZ5yISZ
         adg+KZo78MCeTLAhYt/CZEiYJtR/9yCGh45AKbPZmUXuMH4I3U/YVsRQb9w0qo9i6qBC
         d7XpJBoQedxuB3P04LJdMz/GJLp0dgcpShUa4PYHOp7KbLy6bn4FJp38kTC+lpnb6fw6
         L0QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VIJEWHUWtTaZ3Z+pZVbDaC0ayC4WauwPW71czu2toyc=;
        b=HIEEZnNoHCujrh/aNr6EYKKPbKIAh3+zTkPAem32VbjKQt6ykW6LWALG2qCwsPBwYc
         7/cVd7SJ89qPBt88eP3Db25P/WKI7D+xF9tgewA6VS3V7dnHyIuCloOwtBGB4TDL9T3n
         lz26RVxFmkCa8OWC7+wFuMd6Fj0S9Cc9HMvyZC6W85y7oVetXFWItDuLETA0jhxKr1Sz
         uPdpf+DeQzjdgDfj5/KB0Ad+NUresxCZjoey34hhfpCQiaaxeDmi4e0Qjy5hROXEp8DR
         h6IfEaP3YOJZ4Leq237+t3P5i4HNJv4aE3y0cdbUMeyvC+Opcw/PYH8dR9j+VypTMskT
         /O0g==
X-Gm-Message-State: ACgBeo25XTJaFm5hLdDRZZbY4xawGVhSKWdpWebOopu5EcFUccUDQkhX
	DZ6hQ531XCMteVuXlAusaFDYAuANV0s/UIocVtQOew==
X-Google-Smtp-Source: 
 AA6agR7md+msi8fw4L1X/ONLSeAZM8r/3Vukj/WmEUjtavvRjZdMCsq8vQTbRZtDY0Nd4GC2Qto+vkltA2nEOgLV47c=
X-Received: by 2002:a05:6902:70a:b0:67b:7070:5d35 with SMTP id
 k10-20020a056902070a00b0067b70705d35mr915809ybt.211.1659618440600; Thu, 04
 Aug 2022 06:07:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220804094231.748681-1-Martin.Jansa@gmail.com>
 <YuvENV7uaKfqmOat@kudzu.us>
In-Reply-To: <YuvENV7uaKfqmOat@kudzu.us>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Thu, 4 Aug 2022 18:37:09 +0530
Message-ID: 
 <CAFA6WYPBThQ_ei8dEx=TQ-T-sGHyBZYge4ZyGZz86htB78Jr_Q@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH][kirkstone] arm-toolchain/layer.conf: remove
 BB_DANGLINGAPPENDS_WARNONLY
To: Jon Mason <jdmason@kudzu.us>
Cc: Martin Jansa <martin.jansa@gmail.com>, meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>, Jon Mason <jon.mason@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 04 Aug 2022 13:07:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3643

Hi Jon,

On Thu, 4 Aug 2022 at 18:36, Jon Mason <jdmason@kudzu.us> wrote:
>
> Odd email format.  I beleive you are asking me to apply this patch to
> kirkstone.  If not, please let me know.
>
> Sumit/Denys, should I apply this all the way back to dunfell (as the
> grub entry is there in this oldest branch)?
>

Yeah, it makes sense.

-Sumit

> Thanks,
> Jon
>
> On Thu, Aug 04, 2022 at 11:42:31AM +0200, Martin Jansa wrote:
> > From: Ross Burton <ross.burton@arm.com>
> >
> > This appears to be historical from when the toolchain was in meta-linaro.
> >
> > It isn't needed anymore, there's one bbappend in meta-arm-toolchain for
> > grub which is part of oe-core, so will never be dangling.
> >
> > This variable has a global effect, so leaving it in here has a negative
> > impact on users.
> >
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > Signed-off-by: Jon Mason <jon.mason@arm.com>
> > ---
> >  meta-arm-toolchain/conf/layer.conf | 3 ---
> >  1 file changed, 3 deletions(-)
> >
> > diff --git a/meta-arm-toolchain/conf/layer.conf b/meta-arm-toolchain/conf/layer.conf
> > index 3512c34..dd54db8 100644
> > --- a/meta-arm-toolchain/conf/layer.conf
> > +++ b/meta-arm-toolchain/conf/layer.conf
> > @@ -11,8 +11,5 @@ BBFILE_PRIORITY_arm-toolchain = "5"
> >  LAYERDEPENDS_arm-toolchain = "core"
> >  LAYERSERIES_COMPAT_arm-toolchain = "kirkstone"
> >
> > -# do not error out on bbappends for missing recipes
> > -BB_DANGLINGAPPENDS_WARNONLY = "true"
> > -
> >  # These variables are used for armcompiler license
> >  BB_BASEHASH_IGNORE_VARS:append = " ARM_TOOL_VARIANT ARMLMD_LICENSE_FILE LM_LICENSE_FILE"
> > --
> > 2.35.1
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#3642): https://lists.yoctoproject.org/g/meta-arm/message/3642
> Mute This Topic: https://lists.yoctoproject.org/mt/92810132/1777089
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [sumit.garg@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
>


Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37752C433EF
	for <webhook@archiver.kernel.org>; Wed, 16 Feb 2022 19:04:33 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web09.3400.1645038272366896151
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 16 Feb 2022 11:04:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=p6j2M+9q;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id p7so3719755qvk.11
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 16 Feb 2022 11:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xV8GfFnJxBX85FgwIFdqk6eElW/r6yufEpxycDzmXqY=;
        b=p6j2M+9qKJElD9Qb2U5n1kukLjdHWfCvUag1jJh2p+2sDNxAA3RgtrlbSeCCaBBsho
         3QUuzl62hONIPK8V7rXb8jruk1MACXLZnXjZkqRAk9PJDxOALfDDhqCjjc+RSQ/Vl4Qs
         4NkIjJapFFDP/j7fkpGUWs66m5emfMb6Gh/06jyydG0CLH2ihFHc+wy81SAowb/qxPvQ
         uTHAiPk41M3PZtdZH/lNXv89h6iWDp8sxftWXKY9b2ahW9s8OfVtKh6AmDWy4RD2InQW
         AOFdktRe3k4S/9R2B4WUQx6p44ASeWbOrVl6HMwR5yiMHQkcbT3Z838UnyfiSlTut6K/
         xIMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xV8GfFnJxBX85FgwIFdqk6eElW/r6yufEpxycDzmXqY=;
        b=oabL6jbWZd4NyA+DHjDjbHkh5+k0Zs7D8+Y7w/eCCPTiGlf/GAI2SeFDBLZOmTOqxh
         cdR5nXkI9CACfW1omZQlEzAFWA0QiwTYqRDPiBz/+geThXVlliDM8ezsK3SZNrWDbm8m
         yKfSY98I0IFLsFyvtI1INR91kFQxWVvtgRLsJcmDcb4iY2tGmFrxMHjC15jkgFnpXEZy
         tXIJYH366zKXOEVoz8sYeevbPS3fIukoplWkYmHMRxXvzdM/PElzDTA2xhIDlOeIMR6z
         DNkbLi2rmZTeP5WYjKtp5pXN6uGqgcD25I3BYJHU2mAaVcSlCSaI7PIUaZiwH4SWdu2M
         Lt9g==
X-Gm-Message-State: AOAM533Bshb3ssON7ezBeI0JHB0jmgY6/1dwc2st4LwUU78OXIb0WVb1
	ioU5l2XAKjg2SlCxZiOtSeuK/h09b+ysOx+6Mrvz3OIsmcw=
X-Google-Smtp-Source: 
 ABdhPJyBbRaIe6L8qlL/WEGplRlBqqpb3tObOhbeuIJ8hlK9x4Hm4RxPe2KqZTRhyt0cEHeFiA7RLnZcIJfz2T3B4QY=
X-Received: by 2002:a05:6214:14e9:b0:42d:f1a4:5487 with SMTP id
 k9-20020a05621414e900b0042df1a45487mr78206qvw.110.1645038271324; Wed, 16 Feb
 2022 11:04:31 -0800 (PST)
MIME-Version: 1.0
References: <20220216184220.3494070-1-raj.khem@gmail.com>
 <20220216185312.GP26229@denix.org>
In-Reply-To: <20220216185312.GP26229@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 Feb 2022 11:04:04 -0800
Message-ID: 
 <CAMKF1spSUUVxamZz6CtVoKrr5q9pQ94qwTeXR11hMBrz4Sy_Xg@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 1/2] meta-arm-toolchain: Use renamed
 BB_BASEHASH_IGNORE_VARS variable
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 16 Feb 2022 19:04:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3000

On Wed, Feb 16, 2022 at 10:53 AM Denys Dmytriyenko <denis@denix.org> wrote:
>
> Just to clarify - both of these changes are in oe-core/master-next and have
> not been merged to master yet...
>

if you meant to say that these changes depend on oe-core changes in
master-next then yes
we will have to wait for those to land in master before merging these
in meta-arm.
however I sent it so folks who are doing CI with master-next can use them

>
> On Wed, Feb 16, 2022 at 10:42:19AM -0800, Khem Raj wrote:
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta-arm-toolchain/conf/layer.conf | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-arm-toolchain/conf/layer.conf b/meta-arm-toolchain/conf/layer.conf
> > index fe23fd4..778910b 100644
> > --- a/meta-arm-toolchain/conf/layer.conf
> > +++ b/meta-arm-toolchain/conf/layer.conf
> > @@ -15,4 +15,4 @@ LAYERSERIES_COMPAT_arm-toolchain = "honister"
> >  BB_DANGLINGAPPENDS_WARNONLY = "true"
> >
> >  # These variables are used for armcompiler license
> > -BB_HASHBASE_WHITELIST:append = " ARM_TOOL_VARIANT ARMLMD_LICENSE_FILE LM_LICENSE_FILE"
> > +BB_BASEHASH_IGNORE_VARS:append = " ARM_TOOL_VARIANT ARMLMD_LICENSE_FILE LM_LICENSE_FILE"
> > --
> > 2.35.1


Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00C15FA3740
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 14:07:10 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web11.6861.1666879621843988845
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 27 Oct 2022 07:07:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=rwZbYsvO;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.170, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f170.google.com with SMTP id z30so928575qkz.13
        for <meta-arm@lists.yoctoproject.org>; Thu, 27 Oct 2022 07:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sfDz3rejlpcHu9/QYnTHuwMJdo4eBi1GO6A3uaB0JZg=;
        b=rwZbYsvOliw6+2UFk7jpZhoHfbdcFEQmZz7wvqtgODgyVJCjfSxecxHq8KRUzsuKhA
         b+L1ujTv/ENQ8yelTCScY4ICUUikKQHaxmFUS3ZntOoeMwDmpZ6f645a0h7VN1fVfC6N
         XNZ0YSNaiCqBPTstFK1qu2Wj14lD071sdoDpsAY6sVr3bgVeCWfkFMBLOMKWqmyW8/W0
         Mw6zDvgyHsoHZRj9utd0cOgeXv+pl6FKUl2QZGAew5r3S7C4nGPrfKy1ZevW5lTvis44
         PjnQf943ol8NnM5lKKMGvLEqrME4so27Ox2IhUxs4b9iAedc+pmNmBEGS6L7TeTeYBni
         qTUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sfDz3rejlpcHu9/QYnTHuwMJdo4eBi1GO6A3uaB0JZg=;
        b=7/o6fw3edRC1IUoygmlYTI49nOSwvnqFO+sj78t1mTcm4+4usZgKKZudMMA/WtEst1
         zU87ihqw87/PrWxTM/NZvyqUMScKIUZP/UXwu0fridESGE7QuVJm/qxBLISnLAeIc82L
         zGIUXM1WtHCWlfsngGO6FUZk+l1b0Ukdr/XWpI64fMPan/GHa2GMLkDifuORgM4AupRq
         AV0ay1I9JsINKajM0h1s5mIFXcG4AnPCzJkCvCPqi6N9GxnHQ52mzuwLGWQQI9rkG7fF
         DS+MD31dfh7cTZXcgA5c9SJESygy0k+wvdhdzfjt45UQFuk5WD9IvSCN7W0LDRYwwev2
         YR3A==
X-Gm-Message-State: ACrzQf2uCzPFl06+u1FFDqWYTglaFtpqe3S/Ac9zQz3+JLHXYLBZhWAz
	aWfyVhFtXJYCD2Jqf49VlCwF2Q==
X-Google-Smtp-Source: AMsMyM6JBfCrYAnMKovVSTrVX4xvAaq6yv1hOssZlkIf5nmRXY1x5A9fzC9QhrIFkh0IxyQ9cS9vWQ==
X-Received: by 2002:a37:a8c8:0:b0:6f9:fdba:3d03 with SMTP id r191-20020a37a8c8000000b006f9fdba3d03mr1294039qke.259.1666879620887;
        Thu, 27 Oct 2022 07:07:00 -0700 (PDT)
Received: from kudzu.us ([2605:a601:a608:5600:5336:1ccc:fa87:21b2])
        by smtp.gmail.com with ESMTPSA id i10-20020a05620a248a00b006ed99931456sm1025788qkn.88.2022.10.27.07.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 07:07:00 -0700 (PDT)
Date: Thu, 27 Oct 2022 10:06:58 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: Jose Quaresma <quaresma.jose@gmail.com>,
	meta-arm@lists.yoctoproject.org, ricardo@foundries.io,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: Re: [meta-arm][PATCH 3/3] optee-os-ts: avoid using escape chars in
 EXTRA_OEMAKE
Message-ID: <Y1qQgraLHMBG78E2@kudzu.us>
References: <20221026141854.1557213-1-jose.quaresma@foundries.io>
 <20221026141854.1557213-3-jose.quaresma@foundries.io>
 <Y1ojKImtZ4/NAOvX@nuoska>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1ojKImtZ4/NAOvX@nuoska>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 27 Oct 2022 14:07:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4052

On Thu, Oct 27, 2022 at 09:20:24AM +0300, Mikko Rapeli wrote:
> Hi,
> 
> On Wed, Oct 26, 2022 at 02:18:54PM +0000, Jose Quaresma wrote:
> > This currently can break the bitbake parsing
> > 
> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> > ---
> >  meta-arm/recipes-security/optee/optee-os-ts.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta-arm/recipes-security/optee/optee-os-ts.inc b/meta-arm/recipes-security/optee/optee-os-ts.inc
> > index 10a41755..73b8c14f 100644
> > --- a/meta-arm/recipes-security/optee/optee-os-ts.inc
> > +++ b/meta-arm/recipes-security/optee/optee-os-ts.inc
> > @@ -51,4 +51,4 @@ DEPENDS:append  = "${@bb.utils.contains('MACHINE_FEATURES', 'ts-smm-gateway', \
> >  SP_PATHS:append = "${@bb.utils.contains('MACHINE_FEATURES', 'ts-smm-gateway', \
> >                                          ' ${TS_BIN}/${SMM_GATEWAY_UUID}.stripped.elf', '', d)}"
> >  
> > -EXTRA_OEMAKE:append = "${@oe.utils.conditional('SP_PATHS', '', '', ' CFG_SECURE_PARTITION=y SP_PATHS=\'${SP_PATHS}\' ', d)}"
> > +EXTRA_OEMAKE:append = "${@oe.utils.conditional('SP_PATHS', '', '', ' CFG_SECURE_PARTITION=y SP_PATHS="${SP_PATHS}" ', d)}"
> 
> Use plain += instead of :append.

He's using the existing style.  I think his change was the least
disruptive (than changing append to +=).

Thanks,
Jon

> 
> Cheers,
> 
> -Mikko
> 


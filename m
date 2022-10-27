Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCD82ECAAA1
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 14:03:49 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web10.6865.1666879426496186099
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 27 Oct 2022 07:03:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=ADwx2quD;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.179, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f179.google.com with SMTP id cr19so1181135qtb.0
        for <meta-arm@lists.yoctoproject.org>; Thu, 27 Oct 2022 07:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W3m81JUzCg3sU4dZtrDEH+3HE1AWCSxzvDmjlfGxJJA=;
        b=ADwx2quDKGV9g3Cqf5AefkSMVlxHpXKJvkj2dkVnu4qmrG1yjmUPbVVwAFMzDQoL+5
         yfb+dCSMQMlLGGTq0Gu9bVYp5hK4nPORcmanbB4cnOT9TVcPCQEC2XZ+bbUAuByyJ9Hm
         dLsnMYgU/TqbzjZWdnS88Re2n6GJgYqVdQI5oFVqIjTtgmM1n6+0b55vHVK/Npcq1m9e
         XdE+jGwHvG7Y2TdET2KpfthaXegAQJEHc1dB+/Mg4r3Ld8HxxXCAAzeZi7kFbbF6yCqT
         MrEUzX70L8FUNWwVE4ILCO4UelRAR9YosZ9fpGn2XnP8KwFeSPdhMuVqYRlRSDkonofz
         qhjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W3m81JUzCg3sU4dZtrDEH+3HE1AWCSxzvDmjlfGxJJA=;
        b=DDw0IAPlKXkc5kzKibDr8FSqb5Ubq6Y4VIZMFG4abVDI+UkUmrBKcgi5PzOK0L2faz
         7mG8JUAVjwQ2WRCqjRePYCIRtEui/FNA/g7ezDn1tVzeX3Dr3dM6BWdnGHTXuSfgt2Wj
         g+ENZNRVbtgCK/t2m5b/rNZvd9ejsueBT3BnBALwbosPfa3iWk3KyLiPoCymhIeTx165
         SvJoqoOTLKCgu0N31bsyWa3x+bpk5BJkdoHCoZ5J5WUg71S96BbRbP3CdspXaLcsx8Wd
         mhWjhapLjgIx9win3W3JBgmPL1uqfXov67BKXrkOT4KNSglRYD/ZW0AmsLzSLWxQ8QDR
         A/nQ==
X-Gm-Message-State: ACrzQf2Z8hnnrP4f+0WYVhB5kfiw06/13rtnJgYxq781vXfv0PZ7kHpv
	+gz5dMdSnxUpLFV6udzLabeglA==
X-Google-Smtp-Source: AMsMyM5LlUASIEbVp5tB1T8y9qcSHQT+4uVqvULLVGq4nsNuliRvmHuviiFfq3zVGeHDk2gTgYmEAQ==
X-Received: by 2002:ac8:5c4c:0:b0:3a4:fe93:80b5 with SMTP id j12-20020ac85c4c000000b003a4fe9380b5mr1284492qtj.176.1666879425480;
        Thu, 27 Oct 2022 07:03:45 -0700 (PDT)
Received: from kudzu.us ([2605:a601:a608:5600:5336:1ccc:fa87:21b2])
        by smtp.gmail.com with ESMTPSA id cj21-20020a05622a259500b003a4ec43f2b5sm897303qtb.72.2022.10.27.07.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 07:03:44 -0700 (PDT)
Date: Thu, 27 Oct 2022 10:03:43 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: meta-arm@lists.yoctoproject.org, ricardo@foundries.io,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: Re: [meta-arm][PATCH 2/3] optee-ftpm/optee-os: rewite in a way to be
 less error prone
Message-ID: <Y1qPvwDtDEwYylhQ@kudzu.us>
References: <20221026141854.1557213-1-jose.quaresma@foundries.io>
 <20221026141854.1557213-2-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221026141854.1557213-2-jose.quaresma@foundries.io>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 27 Oct 2022 14:03:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4051

On Wed, Oct 26, 2022 at 02:18:53PM +0000, Jose Quaresma wrote:
> So it becomes clearer the need to use the space in the append
> 
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>  .../optee-ftpm/optee-os_%.bbappend               | 16 ++++------------
>  1 file changed, 4 insertions(+), 12 deletions(-)
> 
> diff --git a/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend b/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
> index 40423615..332c7c1c 100644
> --- a/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
> +++ b/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
> @@ -1,15 +1,7 @@
>  FTPM_UUID="bc50d971-d4c9-42c4-82cb-343fb7f37896"
>  
> -DEPENDS:append = "\
> -                  ${@bb.utils.contains('MACHINE_FEATURES', \
> -                 'optee-ftpm', \
> -                 'optee-ftpm', \
> -                 '' , \
> -                 d)}"
> +DEPENDS:append = "${@bb.utils.contains('MACHINE_FEATURES', 'optee-ftpm', \
> +                 ' optee-ftpm', '' , d)}"
>  
> -EXTRA_OEMAKE:append = "\
> -                       ${@bb.utils.contains('MACHINE_FEATURES', \
> -                      'optee-ftpm', \
> -                      'CFG_EARLY_TA=y EARLY_TA_PATHS="${STAGING_DIR_TARGET}/lib/optee_armtz/${FTPM_UUID}.stripped.elf"', \
> -                      '', \
> -                      d)} "
> +EXTRA_OEMAKE:append = "${@bb.utils.contains('MACHINE_FEATURES', 'optee-ftpm', \
> +                      ' CFG_EARLY_TA=y EARLY_TA_PATHS="${STAGING_DIR_TARGET}/lib/optee_armtz/${FTPM_UUID}.stripped.elf"', '', d)} "
> -- 
> 2.34.1
> 
> 

This is a "style" patch, and doesn't really fix an issue.  I believe
there are other instances of this in the tree.  If you were to do a
patch (or more likely a series of patches) that unifies all of the
recipes to have a unified style, I'd be more inclined to take it (but
honestly I don't think that is a good use of your time).

The other two of the series look to fix bugs and I'll pull those in.
Thank you for the patches :)

Thanks,
Jon



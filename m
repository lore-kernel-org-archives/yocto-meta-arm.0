Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C622ECAAA1
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 15:27:18 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web12.20788.1666625233975103289
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 24 Oct 2022 08:27:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=pyrGBTQ2;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.182, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f182.google.com with SMTP id s3so5773029qtn.12
        for <meta-arm@lists.yoctoproject.org>; Mon, 24 Oct 2022 08:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c0gwWldu3WId7SIQ4k2braSXy70EOJ0hZGgK89CtNR4=;
        b=pyrGBTQ21Q3yCHomaMQCHAVL+gQYgGnXEhnkpAjtYU26VQ/bHPX62y7q/p9vXpLnsz
         P2wlS1kDl4w6l30tYHDUcThJicZoEyX4TFNBRzf52p8B+TZ0A4IK+Hp8mW5yAJLR4icf
         ivdmlarANcW6INa6tkzs/DORvao1BahWlbntZK3uhPXsw1CzQ0+gZJDT93cvcPm95N3d
         JWWeXoR0fsfwruaVYSseG9WR1M0gCuMJCvbkOaCMkao4yVP55iH6uIaMUGVvQjAqxNDW
         mXfMpRgBwjXjNqzc7cQcxretIE1cp6AvKFeXBX/+QW3wpucDfZDluLRs9Njhn4N4cSox
         zIAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c0gwWldu3WId7SIQ4k2braSXy70EOJ0hZGgK89CtNR4=;
        b=k5j8Lj4yCSdMUXeaeRZ8iT3cY8RsURxJP8gSPKYomXznrDdF8TrWMQl3+auN6ZV8W+
         osfIowT3NDvPLyBtCO1hxbk4b895UZHtf2nlhJwywzvv/ugxasWuAbeImJCpy5+1FV/C
         e3zI+h/yGN/tiZhr0mdUSwWYGQXtkgy9Ztg0CylXS+IocB4eOuBNfBV8KZL3UcDo7TAM
         818j1hwdQIn7su9+ehpoyRkx+zvN4VaqKtauhbQZ1TDHACmPCcChApts3cwH7L67buGT
         23kpFdZBjlsYrg6KV5ecNeSQEZNlbAozslWehG+f23blGCZsvZQIL+ObrKIm5FX9XG3L
         KoVA==
X-Gm-Message-State: ACrzQf20ql9WcKhODfrfZfscixto5AXH0UAyJpUMDd0e7ejwXM+LXH/E
	og16Rtyt++Zt03n1DBnmHLrnYAc/6g69tg==
X-Google-Smtp-Source: AMsMyM4tub0md90HMxcF/V/J2mI377UiyKBJUOw59YIFQ1TtSjBlW1MMX/UF65xAGz3kX7jqoRtNeA==
X-Received: by 2002:a05:622a:212:b0:39c:eb23:9aa9 with SMTP id b18-20020a05622a021200b0039ceb239aa9mr28320794qtx.261.1666625232557;
        Mon, 24 Oct 2022 08:27:12 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600:5336:1ccc:fa87:21b2])
        by smtp.gmail.com with ESMTPSA id r4-20020ac867c4000000b0039cbe823f3csm130374qtp.10.2022.10.24.08.27.11
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 08:27:12 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jdm@athena.kudzu.us>
Date: Mon, 24 Oct 2022 11:27:11 -0400
To: meta-arm@lists.yoctoproject.org
Subject: meta-arm langdale release
Message-ID: <Y1auz43IW/C0KJm5@athena.kudzu.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 24 Oct 2022 15:27:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4022

meta-arm has released the langdale support branch.  The branch was 
forked on 24 Oct 2022 from the master branch and was tagged as "4.1".  The 
tag is GPG signed and my public key can be provided if someone wants to 
use it to verify.  Per the previous public discussion on this list, 
langdale will only be taking bug fixes and be passively maintained
(with kirkstone being the actively supported LTS).

Per an external request, we have duplicated all existing numbers only 
tags (i.e., 4.1) with a yocto-x.y.z tag (i.e., yocto-4.1).

Thanks,
Jon


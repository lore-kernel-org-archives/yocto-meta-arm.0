Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 516BAC4332F
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 15:57:00 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web10.40358.1699891012679413796
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Nov 2023 07:56:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=X4ikF7o1;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.46, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-66d190a8f87so27416006d6.0
        for <meta-arm@lists.yoctoproject.org>; Mon, 13 Nov 2023 07:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1699891011; x=1700495811; darn=lists.yoctoproject.org;
        h=content-disposition:mime-version:message-id:subject:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kjIBUshS4iQEXc899R1TcUXJJV3ZKW4nXLZ0O5F3HAs=;
        b=X4ikF7o1JPU80pb6L0VvFBcegOI7FKkHxq+EcuuTf/jMDBmWM0GmQKa3zOlw2weyUo
         FC6tP5XsmbT4gT0rnVsA4x76Sr7bhomUuHyEEQ6txG8V4AlcL4BczZIBvJwYlsTO/3UE
         vYzqbpQArpLTjde47J41yoDkLoxsjsj/SgpeOWil7e17ZtJq8kqjosBaFrnWlTUiqux0
         6+uQH0QxYrzsEdeMi8RHu2oxhJOT6G7TY3yPTyvLW1T2KNcIjbeT8oJJS4crDB/ZDUVw
         6tx9TmOtMkkxBDk3PMwwvxBeSmXyQGMDtNRQapRpuqsUkcSh+4Ae+bTVlzYkZegfSex9
         rjkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699891011; x=1700495811;
        h=content-disposition:mime-version:message-id:subject:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kjIBUshS4iQEXc899R1TcUXJJV3ZKW4nXLZ0O5F3HAs=;
        b=kNay10YWabfhb+gYV5U4vXmPgiLzXlrRBvZDlZmABFKzQ/Fz3rQGjk6WsqKB6P/Jm0
         PHeICyv3gSvXy4j6DjpoBXamh1uJZ5ljEgqdZmToOJPotKCd8aWoFDHJSGddDWGcYBn4
         KEMx39HZEhzbe0uYO1ZqzdCLV+uhxMyRo43SAyJsAIOVJO9GFiLCBWVwfsShIhmAcGL5
         ZX/a4yeVBb41nwaX2+uuZlxn31wKQWb37GrghqnWgSdMKKNX7PAXsqx/sdmTrgSC3rlL
         qFOF3ChQid9+bdR7Dm23/chh70DFmiQaYgN7dlfJe8ClFln/mZTOQ5eoFrNLYJiAvWY+
         OZLA==
X-Gm-Message-State: AOJu0YyLGEoXWnxP9V36psHKNprSS0jWHy5mgqammVJDGigb0KoDf4rK
	JfWjFBBwHI3wXiMcwU6JJC2uO5UsQjhLMP+wfrM=
X-Google-Smtp-Source: AGHT+IFi4wjhPxlXd8iDrb2LFv20aHDHK5LicI/pzoD6NFlZ+0M00xMn2BkpLkCRxkxFzAdrtnV9ZA==
X-Received: by 2002:a0c:e74c:0:b0:66f:bb3f:2e1 with SMTP id g12-20020a0ce74c000000b0066fbb3f02e1mr7068495qvn.19.1699891010943;
        Mon, 13 Nov 2023 07:56:50 -0800 (PST)
Received: from localhost ([2605:a601:a688:2c00:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id t12-20020a0cea2c000000b00658266be23fsm2168309qvp.41.2023.11.13.07.56.50
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 07:56:50 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jdm@athena.kudzu.us>
Date: Mon, 13 Nov 2023 10:56:44 -0500
To: meta-arm@lists.yoctoproject.org
Subject: meta-arm mickledore update
Message-ID: <ZVJHPHJSBv6RZq4R@athena.kudzu.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 13 Nov 2023 15:57:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5235

meta-arm has released an updated mickledore support tag, 4.2.1.  The tag 
contains 47 patches from between 15 May 2023 and 19 Oct 2023.

Per an external request, we have duplicated all existing "numbers only" 
tags (i.e., 4.2.1) with a yocto-x.y.z tag (i.e., yocto-4.2.1).

Thanks,
Jon


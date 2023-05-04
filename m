Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8CD2C77B7C
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 21:11:19 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web11.6633.1683234670646037620
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 04 May 2023 14:11:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=KrbDhwx/;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.42, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-61b40562054so5309096d6.2
        for <meta-arm@lists.yoctoproject.org>; Thu, 04 May 2023 14:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1683234669; x=1685826669;
        h=content-disposition:mime-version:message-id:subject:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=usLTIB8tfb3PSLi11bgAxiCFs7ntbhBZ4hEAKvPuQlQ=;
        b=KrbDhwx/5eEd2p1CUKWW1kW6PmA/Ed58eprd1BCQQEMzMdUTtn9lIiz+R40mPpjE8+
         sJ1FJYBRD4pCuGsvbwLj0yCm2DdLPd2IuLq7FSJM411/v1tNp/KoZxXloREwEFRXpKor
         yjDtRzKJAnhWMibVLuaiRd7u9/eqao+oVxDQT8p2qvmcG29RlvsAgJhUm6dOplkXMNp9
         Af4cXZH2RW4yZX3gK25LXjNKFicqiu6ApDJ8jx1cWCTavXfCFBULhNPh9F9KWih1eqOi
         YdIupGzRVEwxJGnLmjOiTVMoXn16EE5k6DDtNbMNpcvvD33lw+0TPhKLeskESNNgTW18
         VPnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683234669; x=1685826669;
        h=content-disposition:mime-version:message-id:subject:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=usLTIB8tfb3PSLi11bgAxiCFs7ntbhBZ4hEAKvPuQlQ=;
        b=d1rUR671TVvPhWtmJnMIzgIyl7K0yxdXjGq+Slhs42RvbiIcLXYVwx+3WJb+MGtVtE
         jFHnIUbJ2EBEgD7MvDKPAABCO5zBouACfGKs7inKo73kZbCKga42ktsu+mUG++0zkY/O
         vwrT7GJMP5o+uqyWOC167bZGvwpxnGABXm8EBS00vx7Da2KdOMEmt3V5Qf2AHzOWpXke
         LXy+cR9XzgmHp74h7M2O8LOWXQNaiwQbkSTBJAh49tzix8/cDNcC+LpoCIXdJ+fAYr1c
         y3wTpBHi39jRu29WL/VUVZfzFYU6lWJm7/q1JnbZwW300Lr/MjGXfoC/GfdZe+gBjKgb
         HeEw==
X-Gm-Message-State: AC+VfDyW9XsUtfim0X4WsST5oTFLQTF6k0xB5S5UMOWYUbe2vrheBXuO
	WH7SaOUeONEG8zmC9XPSr8Zhk+Mu8rVIFgw7w5A=
X-Google-Smtp-Source: ACHHUZ4hAlXUQk2RP2jYL+YJiU5MS3qLu3cpeCWJG/oN1DzOR9Pb28ETHQev2xp5jNqIHf0zcZPP8g==
X-Received: by 2002:a05:6214:234a:b0:5f1:89ba:c0dd with SMTP id hu10-20020a056214234a00b005f189bac0ddmr17740569qvb.30.1683234669204;
        Thu, 04 May 2023 14:11:09 -0700 (PDT)
Received: from localhost ([2605:a601:a600:7900:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id h26-20020a05620a13fa00b0074acaeeb7c3sm76254qkl.91.2023.05.04.14.11.08
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 14:11:08 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jdm@athena.kudzu.us>
Date: Thu, 4 May 2023 17:11:08 -0400
To: meta-arm@lists.yoctoproject.org
Subject: meta-arm honister update
Message-ID: <ZFQfbJXJJkgj8EDy@athena.kudzu.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 04 May 2023 21:11:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4636

meta-arm has released an updated honister support tag, 3.4.3.  The tag 
contains 2 patches from between 18 Jan 2023 and 19 Feb 2023.

Per an external request, we have duplicated all existing "numbers only" 
tags (i.e., 3.4.3) with a yocto-x.y.z tag (i.e., yocto-3.4.3).

Thanks,
Jon


Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19AF9C7EE23
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 11:01:07 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.5455.1686135665800061100
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 07 Jun 2023 04:01:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linaro.org header.s=google header.b=DUWSUWhI;
 spf=pass (domain: linaro.org, ip: 209.85.208.175, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2b1a4250b07so82414931fa.3
        for <meta-arm@lists.yoctoproject.org>; Wed, 07 Jun 2023 04:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686135664; x=1688727664;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OVqDSQb3Df9pud06FVTM5le2VDwmQsKhEg9U7s7UrNo=;
        b=DUWSUWhIgz/j2SulBLJQP5YBr/fFS9FB+R2fYV/wSWF4ZbogzSy7IfrL5bIQcjdsnE
         XECvbSwtsXOSOvh10zlNzCqMs6v7eeNu4N5oHzfrDG2l/9TfmUN/CwmJVbiu+hocvp21
         +6bqdZIVjSQ0j2O4jA4ZrS8yqyYfI4xBN08cB4RYIJzRfbPtBPzepyM4y8ijtweaSRiv
         oLZKGeEQ6fD7Gk6oExQyOWQUdfm+K1cFK5kqYNsU3RZtvRPfkdMerGRrMf8cx/yb3/YI
         p9UeM2sDnk/bJ/Q/jcKOfXUFKyU81EF6Qp0i/7a/zcnmlL/xtbND6MFv/mXLy4bjIKGw
         BZQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686135664; x=1688727664;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OVqDSQb3Df9pud06FVTM5le2VDwmQsKhEg9U7s7UrNo=;
        b=MaqexIh37bz3VWtfs6S/NNix/PHQ2SW0S1+/jSFV5BKPi5SSlIS/3XV/aWkNtuc1Qo
         jhQtUwSkZB1fTQFizOFS4EyouLzoCwp8tXKd321Ybi50CF1FYQ9Ka8xBB3i36g4hpOZX
         ZriXNbB8eppGjNfr/FCrgXIy+E3Ao1NcihvpxA6j8Y3VSiYwcj6FocBhXh1054yl7TST
         lYN2yzsTpSSfqprm6aDZWCkHKBymUbyvuVOolR+raHK+aUiheMpRxv9pwtLj/15Ldrpo
         k8rfgIeD2yiuYsJQefcH/t5AkH0XxRXqEnkFCRF/3ziXNquVbgPdzdAgeWw9LRLhkATE
         6/IA==
X-Gm-Message-State: AC+VfDzbxdJakm6a+hFwTX1UQrbXhK+HPokQ6niIz2/qiFSR4ELUm9C2
	/XkFVo7DA0D3cEei3fj7f5KhpIu65YOqSYTf8No=
X-Google-Smtp-Source: ACHHUZ4o4FjoVXDowwtei/tJFVA4RDX8prjIATawxn4Pej/CVDwyZ1076YSQFoc8KRpgayljAL+MQA==
X-Received: by 2002:a2e:9c86:0:b0:2b1:bf5d:4115 with SMTP id x6-20020a2e9c86000000b002b1bf5d4115mr2181762lji.13.1686135663572;
        Wed, 07 Jun 2023 04:01:03 -0700 (PDT)
Received: from nuoska (dsl-olubng11-54f814-94.dhcp.inet.fi. [84.248.20.94])
        by smtp.gmail.com with ESMTPSA id y4-20020a05651c020400b002ab1536377fsm2153079ljn.105.2023.06.07.04.01.02
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 04:01:03 -0700 (PDT)
Date: Wed, 7 Jun 2023 14:01:00 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Subject: optee: CFG_MAP_EXT_DT_SECURE=y and CFG_DT=y mandatory or machine
 specific?
Message-ID: <ZIBjbFIsz5x+721R@nuoska>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 07 Jun 2023 11:01:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4741

Hi,

Change b81642c5f8566a947a13ccb3ef135157b1842449 says it's for qemu only
but in meta-arm/recipes-security/optee/optee-os_3.20.0.bb

EXTRA_OEMAKE += " CFG_MAP_EXT_DT_SECURE=y"

applies to all machines, and this in turn depends on CFG_DT=y which
is also not ok for all machines.

Should this actually be applied to only certain machines targets
provided by poky (qemuarm/qemuarm64) and/or meta-arm?

Cheers,

-Mikko


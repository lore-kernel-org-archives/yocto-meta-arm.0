Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83F7DC38161
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:53 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web12.3561.1649881840189138747
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 13 Apr 2022 13:30:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=Z53V/cqq;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.178,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f178.google.com with SMTP id hf18so1755524qtb.0
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 13 Apr 2022 13:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=UDPTtWXPUotktzLbPeQHr/Ph4alcUGvDEq6A2jRgQns=;
        b=Z53V/cqqcJ5P8kYneUlqLuqdjPg2ehkcisehF4oP2wD6IqypBz4Iq8ZBEmT6eoJGjz
         GTIaeA9Z8/THvUYZ395RRSDw4atRva5zXQoYMJa/irDoXliT8AMaEV/toarzbulF30AL
         LEFEb//SSlvu0Ocus3Z8L9JrImuPez0QpQp0zIHzJQ/nL1VVIZCT7uHuZ2uIU1JPaek/
         UarVUGrSXNXsGWc1cSMlp1hFLonM6sGlbj0QJhk3i/YdvSPBJrSTwbTLtXoK4d/fcMvk
         PP/mirQgL5zXMrEyQMy1Puwo+JrKTVQVE/T8hN/xLyqw1FqU8nkwHypCbCnZ/C3RNOGK
         oHGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UDPTtWXPUotktzLbPeQHr/Ph4alcUGvDEq6A2jRgQns=;
        b=wzM+ITDcAf28LCbWT+ZFIPVtUhzURcJkTR0omb3DzUqpzbgFAsIvJQdhqREVS/zxMP
         0XOMxVgD2rLU8oOQzQuRnyaI8QCx3Y4nfr5Ko5yLxN9ohM/+t/HRoG9X9OAbN1Ty5vDl
         JO5q8ATuVboBjrcsbyKy5GvAKuyEoQu+NWnd2lq0RIgRDZd5R0RAzj2vFJlznxUwg/6Z
         quqYWJFPwsjMPiozzrC1X/MD43wm6/BTGuX/1AqCWX005+QjXr34cDcP160ovauq4AIn
         z2jLA5Dxyowt6XkTF9XAgS7AMAvBxaA1lwE9CTb4yVZG28v2zdATFUoSpYIONm81e1fN
         8XDQ==
X-Gm-Message-State: AOAM531/sIQq0wfuSzLp6Pqe7fMzFCC12pj6OD2H2ORvNVHYwH9WVvRr
	W7ePXoHdBnCIAZ/psxVO9czOVEjiiSQh7w==
X-Google-Smtp-Source: 
 ABdhPJzw1Bc/f+GTkUsAzR0YF8PHCr5hJf4GsSlHZbuLNBz+pJgLtPgNOSTX3dlPvKvHiH4HvT+33w==
X-Received: by 2002:ac8:6ec7:0:b0:2ed:10a7:2c1a with SMTP id
 f7-20020ac86ec7000000b002ed10a72c1amr8709759qtv.206.1649881839192;
        Wed, 13 Apr 2022 13:30:39 -0700 (PDT)
Received: from localhost ([2605:a601:a66c:b900:3b2f:a3a7:b707:646])
        by smtp.gmail.com with ESMTPSA id
 t19-20020ac85893000000b002e1afa26591sm33183882qta.52.2022.04.13.13.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 13:30:38 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	ross.burton@arm.com
Subject: Re: [PATCH] optee-ftpm: Use the latest fTPM sources
Date: Wed, 13 Apr 2022 16:30:31 -0400
Message-Id: <164988183534.257858.16949395081583242294.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220412210012.3265592-1-ilias.apalodimas@linaro.org>
References: <20220412210012.3265592-1-ilias.apalodimas@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 14 Apr 2022 16:03:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3271

On Wed, 13 Apr 2022 00:00:12 +0300, Ilias Apalodimas wrote:
> The recipe right now is using https://github.com/microsoft/MSRSec.
> However this is the initial reference implementation from Microsoft and
> things have been moved into https://github.com/microsoft/ms-tpm-20-ref/
> (in the directory Samples).  Switch to new and currently maintained branch
> 
> Testing against real hardware (the SynQuacer DeveloperBox and a rockpi4)
> didn't sound any alarms

Applied, thanks!

[1/1] optee-ftpm: Use the latest fTPM sources
      commit: 3ee7d019898854f776f95ed31f4b7ea8c8a73dfe

Best regards,
-- 
Jon Mason <jon.mason@arm.com>


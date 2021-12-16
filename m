Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BF03C433EF
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 21:04:57 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web10.256.1639688695695150404
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 16 Dec 2021 13:04:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=51DABo96;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.51,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f51.google.com with SMTP id js9so452153qvb.12
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 16 Dec 2021 13:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Lhk/6WfvEFgyxKHqk94iLYLMjsLq/ffcF2oWjnG02Hg=;
        b=51DABo96HRdAq0uMw+ZtcNMa66um0IS8HTWWj1Cyr9GTR37rV9HaoRJ5rZvsfVXaDc
         siFo2x/sr6j1w3Kf9mH11K5PG+7/tXHFo7Y8DuqYJfuM6BCTx32BPPqwZfJRANyqc4eX
         mAfxJbJwzG8tW1sff9OHRMeTl+uaHY4wkAG8MwhBCnUydEjK1H2Tn6EV0R9ZLsLVnmvy
         4ztq0bbaH1+hRS3EuMQxZdYkvMr5GTU2kDWAdXkTee4RIrzHPT16gjYjc0nPl/0s9IKF
         6gqDrc+00ncrhKyOefTQ7rpEbjDxYhe1cERVoTQgxUGu5AYRc9bGQC8/1Qs/KqtI6Zh9
         IyLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Lhk/6WfvEFgyxKHqk94iLYLMjsLq/ffcF2oWjnG02Hg=;
        b=HIqP7e/UTBZ2dSVhNANMuyuGoLMyfJiACXUJFSEx2k5aaQLxBeM25qIPkqSsxKuGkh
         FoukAIWRF0zF1aPdYx704y6W1hGiQQyMRbrFABf4ZufwmR4nM21oSlpP/08l1qU4F6qh
         8GVaREXXTGD+U7/nNUryApoH5B0J0V22639ThMJ4L5VTe0GaaaqKVZ3kC5WvIBnN2T4p
         7/43OeBkn5kf2ZK+hcxERe5qEoV133gz8Y07PuQYEknAM5vSBexd+VohTob9AAcx3DyK
         Mk1xnySxEdDth8qxMUJg4KW4P8Q2HVDSy0W6PN8IfTCTfCQfR/4noowVBcdIKMK4SGHf
         8RxQ==
X-Gm-Message-State: AOAM533cEAinP5FLC/aplDBSrVMwrsrYm0lLCHYJHYlcl/RwZRxkvL6P
	9QwoeFoHHlVd7LtNrF3OIdO2gE14Ap9fiwN5
X-Google-Smtp-Source: 
 ABdhPJzKrZ9b3AZ8BMpGCs38K7FY4pHERUh/JlkGhSUbDYuKrOeKQgotEtYGN1LCcq3SjhGdIdpH3g==
X-Received: by 2002:a05:6214:2341:: with SMTP id
 hu1mr18013925qvb.78.1639688694663;
        Thu, 16 Dec 2021 13:04:54 -0800 (PST)
Received: from localhost ([2605:a601:a60f:e00:a1a6:f88b:686c:916])
        by smtp.gmail.com with ESMTPSA id
 d15sm5114354qtd.70.2021.12.16.13.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 13:04:54 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH] trusted-firmware-a: move corstone1000 to TF-A 2.6
Date: Thu, 16 Dec 2021 16:04:41 -0500
Message-Id: <163968868085.10503.16725646393652744046.b4-ty@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211216101828.3239975-1-ross.burton@arm.com>
References: <20211216101828.3239975-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 16 Dec 2021 21:04:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2731

On Thu, 16 Dec 2021 10:18:28 +0000, Ross Burton wrote:
> Now that we have a TF-A 2.6 recipe there is no need to use a post-2.5
> git snapshot.
> 
> 

Applied, thanks!

[1/1] trusted-firmware-a: move corstone1000 to TF-A 2.6
      commit: c4f5359672f1ca77d87cc45cbe5e9cdf258058c2

Best regards,
-- 
Jon Mason <jon.mason@arm.com>


Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 336BAECAAD3
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 19:15:29 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web08.16828.1662059728432098232
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 01 Sep 2022 12:15:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=r3BPJUtt;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.178,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f178.google.com with SMTP id l5so14248790qtv.4
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 01 Sep 2022 12:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=JMoXR1glpPrcnNBKtzJgW8AIBftYm0n8ByPxbde6EHE=;
        b=r3BPJUtt12FiO0I/NWHoEyMrtnP1YGWsrNwnufTiKVC7HBsj6OWe82mgQQG04Shm9M
         BA5DtoB/PhvooudX1G7GkdIwtysSM2Vk5CUK4JIHEQ/0dRHQjGImSI+WxTMj7Q5Y0KG1
         miVp1GTxO+/YtBY6sjbTouGVO/f/OM9WZpstiLWx9JlQyCuMvXlIEH+ZzCcvuT9+71A8
         Z+zqs4Q++qD2eWqln44G/h0SdgWFg2WnDjEzSlfaEv31l3IkxkXoN6/9E38o3CB+9g5i
         JONTPF7ibHQqNLqqb+jOGyEV9MfEKMfbnceTcDHt+brarhxSOm4imbXQ5op70hi5RJ55
         YlCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=JMoXR1glpPrcnNBKtzJgW8AIBftYm0n8ByPxbde6EHE=;
        b=Tl7JB0ajvKK07O1cXbWZtDxmfLhpUbO1b3xLb2BoHbs+TRXrQh2i3YRgQXExLAkjA2
         Z79lAcxHRJj4oNO0D5XN2oZ7rJAWDDQbXUvfCv5rkyRKKg8KsiUFi263L6J7V7QWOWTY
         xi9vARc7eQP6LHRcPn39th6IKDwpqUpm5/s8u/yb0ZXcCgT7Zq4nZ5DGz/pP9cQYxfMm
         MFdgIwKqu4+SnSoglS3S8WwdKzlXVe2sZ6o36cKvwcGLsI2emPvuT+/V9KPnGsdxqCpq
         8M512bFqqAxrFjTne30DNkdbqybuG6ZIi5TOVOKEtCMCL416IRTJJoEEcvqMqsnCc9z5
         Akpw==
X-Gm-Message-State: ACgBeo0cEM+138ahyBXWzSliGUY9V59SfKnmDeN7I6ZKV8SrxBte+axo
	QUJjKIqMTFPLU1mDXqkSZc5vTATuOtIyf3B9
X-Google-Smtp-Source: 
 AA6agR7GoW5utnGcp/5NzCnreuYiik344EdEQQSt36giENcJ2vW4gVVvN2d8RSXxU0o3m4ZMcpL8vw==
X-Received: by 2002:a05:622a:1305:b0:344:9050:79dc with SMTP id
 v5-20020a05622a130500b00344905079dcmr25318973qtk.335.1662059727024;
        Thu, 01 Sep 2022 12:15:27 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 bx4-20020a05622a090400b00342fcdc2d46sm10724992qtb.56.2022.09.01.12.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 12:15:26 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Peter Hoyes <peter.hoyes@arm.com>
Cc: Peter Hoyes <Peter.Hoyes@arm.com>,
	Diego.Sueiro@arm.com
Subject: Re: [PATCH] arm/oeqa: Make linuxboot test case timeout configurable
Date: Thu,  1 Sep 2022 15:14:17 -0400
Message-Id: <166205965711.3296684.11607823939393122776.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220901095702.3046618-1-peter.hoyes@arm.com>
References: <20220901095702.3046618-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 01 Sep 2022 19:15:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3734

On Thu, 1 Sep 2022 10:57:02 +0100, Peter Hoyes wrote:
> In complex stacks, e.g. with many cores or many init scripts, the time
> to Linux shell may be more than 10 minutes. Make the boot timeout
> configurable using TEST_FVP_LINUX_BOOT_TIMEOUT, leaving the default
> value at 10 minutes.

Applied, thanks!

[1/1] arm/oeqa: Make linuxboot test case timeout configurable
      commit: 8c97ddc4233d658c6c74a14e501cb2b0022c9097

Best regards,
-- 
Jon Mason <jon.mason@arm.com>


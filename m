Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5908EB64DC
	for <webhook@archiver.kernel.org>; Mon,  3 Jul 2023 22:23:54 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web11.45881.1688423032001058283
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 03 Jul 2023 15:23:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=KZQqxmLD;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.180, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-765a1690003so424882585a.0
        for <meta-arm@lists.yoctoproject.org>; Mon, 03 Jul 2023 15:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1688423030; x=1691015030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9goXW8Pe8W3E1/Uvufqg5m7m925TwBtX6VahQA37Fuo=;
        b=KZQqxmLDVgmnwPm+qDafc8cSY2Ir8IlIwIPgz0XtL0sKeU3DTZ5c6ewYqbotJHA8Dd
         T/qVfoSeDgmntq0Z89DB+4HQOuXVLGD/rBwHsAVd5S5hK8NfU6Ud050hdvGivuzNMe5f
         LVd9+vKnqPXHK99+qut+CswyFpdbhjKmoqx0zppylulMYLVZjIi0uMFUKD1crGCiD7xW
         q0F/B7yYBlrhTZNdirk43cCDizN1UclX1ofVntDL8J/63MFvOtYAb6ugipswe97ERyK3
         Z1VYUNIzDEyA55jFYat0Cx/bDnFu/g8dTjnZb4UKB5Zefn8FtRAl3IVteiW6gs+1Ekas
         /Y7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688423030; x=1691015030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9goXW8Pe8W3E1/Uvufqg5m7m925TwBtX6VahQA37Fuo=;
        b=Z/9baWYQFSYllUw4VEut5K0EnGHwiEBKv9z4fqZcOXCR99+1kcCDfMG82e8XhOvVjG
         HCaO+pyEFS+PoXzVD1DF7Q0akp6dcVNkYyAAebYF3sHr2OFHxKai0f0fFV/pQikP+Hrh
         SggrXyUrMvYkm69tJJYomtF++zmwDChg5lxVjbwxTyt0fAyXdFP3RXcOBrsFx6Ulnhun
         pxmgBcuo5sZjHNTfZnlJGzJY2FSAMaosjnBWA1JFXR74Vj52TXZtbH+rQfP/txecTrqx
         J7WaIQo7Y2RxMMHRxwIEOG/NW4+xczUKzCPnV3qPyJBOiWQrBNdFbFWskj7qIdN4qhSU
         bhsQ==
X-Gm-Message-State: AC+VfDwnU7PxfUNkG951qBylIh1Y4YULNP3Sp7S+w2iPdAdN+KpZiBb2
	7vd1dRlErXKexdOzZDyNr5/vAiFZE8ReO0WwkWs=
X-Google-Smtp-Source: ACHHUZ7Cfu/SdcVwMS824oot659K+Ot36O3Hq5HoCRD066YEMeiIxMa/RIPQxbf7cgY8Y8vme5SoFA==
X-Received: by 2002:a05:620a:47b3:b0:765:3fcc:4f9e with SMTP id dt51-20020a05620a47b300b007653fcc4f9emr12680698qkb.38.1688423030617;
        Mon, 03 Jul 2023 15:23:50 -0700 (PDT)
Received: from localhost ([2605:a601:a600:7900:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id z15-20020a05620a100f00b00767410d18c3sm4378960qkj.36.2023.07.03.15.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 15:23:50 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Khem Raj <raj.khem@gmail.com>
Subject: Re: [PATCH] gn: Disable warning as error but not disable completely
Date: Mon,  3 Jul 2023 18:23:44 -0400
Message-Id: <168842302537.3607005.6042006547578420005.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230703043511.123460-1-raj.khem@gmail.com>
References: <20230703043511.123460-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 03 Jul 2023 22:23:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4850

On Sun, 2 Jul 2023 21:35:11 -0700, Khem Raj wrote:
> This will still emit the diagnostic but it wont break the build,
> additionally pass it to CXXFLAGS since thats the right subset to
> disable it for.

Applied, thanks!

[1/1] gn: Disable warning as error but not disable completely
      commit: fa02cad2dae68e07e4c62a2df0ac5e247207e9ca

Best regards,
-- 
Jon Mason <jon.mason@arm.com>


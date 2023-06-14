Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8022EB64D9
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 13:09:05 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web11.11265.1686748137289794811
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 14 Jun 2023 06:08:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=PDWWW212;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.182, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-3f9df7eb837so18842421cf.2
        for <meta-arm@lists.yoctoproject.org>; Wed, 14 Jun 2023 06:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1686748136; x=1689340136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kv77QqGzSz0fBV3XFY50UC2aURWRdH20s22hBPnmtrk=;
        b=PDWWW212S6YQ61v2iL3JdkCD90/en2rWYZg/kh+46DQ9THcMEbvIqbqZdnFxER+8RI
         ecM1y4iphnLryY5m6HDCPBpGOMvNoEnuI0GKV+6rwJumFIwsTPKIHwoY/rCJweKiszhp
         kfMk2zJnhfeUnDSP+INS0MwBrHn02UQOOig9ynzBtRkB0/fBJgXFJFbggvljug9jwiAg
         ZfgehivdLKnRkqeHAeMcRdmwoN7tKToh3FaFxGZ7FBz2ck2NVeKI5/X2C2y9+LYJDxNR
         hYZK1EEIe8GUeK6QZthT8ssAGZJ4WbwMJbz+KprLXxU0zaVymJ/nXCpcsZeV265Qg1Lm
         Erlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686748136; x=1689340136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kv77QqGzSz0fBV3XFY50UC2aURWRdH20s22hBPnmtrk=;
        b=P6ChiRSwMUSctDfAyxTtWb8JRyHW6L9xy0cUs7GhFJcGjbgEHklDfHJP3GvKtVA3qk
         EUfs9DGpdATxODqQKgDNJzwyAAtGF8RTb8YghpQfWB3O6zeHC0f131MYbquXnmfknrFh
         rHrnwLFLtaFaQs8STGmKa0ls1ZjfMUlrM456VJxqIIYQe2sAiYIeeBKrbvYzb4+VWT9N
         Ow3vRsqv/tR2zlqgb4P5fwxe3zBEDtFndJZ3VzsxsecSgmj7nPVm9rHc2muXLtsdoEM0
         T23N/ggz4tL0SvXh5f70yKl5xpqMHTNu+iSKzEqlM9LypShGXj8fkkgSShnaMT6UOTkK
         3Ftg==
X-Gm-Message-State: AC+VfDyS2FVX9BcINYNCU6gbRFu8aHaT0adzN4TUxOXNHQh6Zoo73vps
	3ZMHEuqoqLYB7ogVNDOTGmSzPwzqlS9T2zMPoRs=
X-Google-Smtp-Source: ACHHUZ48K8SqhGS8r+kZVWO2kn7hpab3+an9NFsn6VRXgBMJFUWZZQBY8lgczqJzKMedJQICDCe+vA==
X-Received: by 2002:ac8:5bcd:0:b0:3f6:a7ad:9edf with SMTP id b13-20020ac85bcd000000b003f6a7ad9edfmr2384609qtb.40.1686748136067;
        Wed, 14 Jun 2023 06:08:56 -0700 (PDT)
Received: from localhost ([2605:a601:a600:7900:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id v26-20020ac8749a000000b003ef59e2b9a6sm4994111qtq.78.2023.06.14.06.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 06:08:55 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm/scp-firmware: update to v2.12.0
Date: Wed, 14 Jun 2023 09:08:02 -0400
Message-Id: <168674808553.2420450.9340619889967265037.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230612145048.3336128-1-jon.mason@arm.com>
References: <20230612145048.3336128-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 14 Jun 2023 13:09:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4780

On Mon, 12 Jun 2023 09:50:48 -0500, Jon Mason wrote:
> 


Applied, thanks!

[1/1] arm/scp-firmware: update to v2.12.0
      commit: 69b4910f755bb181f6afca00c23f867adde40e2e

Best regards,
-- 
Jon Mason <jon.mason@arm.com>


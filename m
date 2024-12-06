Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CAF7E7717D
	for <webhook@archiver.kernel.org>; Fri,  6 Dec 2024 15:44:12 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web11.39879.1733499845529420304
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 06 Dec 2024 07:44:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=emG+uZqC;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.43, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6d8878ec049so16098966d6.3
        for <meta-arm@lists.yoctoproject.org>; Fri, 06 Dec 2024 07:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1733499844; x=1734104644; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E08rb15y7TY0CjkDPydwmh9btoLt+U4F/WXcoLw0cJc=;
        b=emG+uZqCW66yctQloniVs0RIzDFfzsfPJckNkHpeHnOnh6gxNvNg40U8pPsqXhxabo
         atP8ceRUkAs3KBMXO/ez2UIS+SeAJ5PylRRT8pAuMAZoRW2bFYJ6fKmKgNCTWNYnkThO
         bSImwCc6fq4LjJAaCPFZxskZ8CgHvGZms8a1xGywADVfM8YLGQCYsfLt2owhV7C0LQby
         LE4DtpnKPaGEYx8f7LRVd0MNFz5i1ZJ51Z4r2YdIuha9jna7/2MW4bEIgpltpuQ2mb0b
         kv0z5Ma7ocCrLbhraD2/5OWFtR9eAZ81nbmz4X/epOq0RRIvxkCTJrSJgTtqn9rWQ9bU
         NgZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733499844; x=1734104644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E08rb15y7TY0CjkDPydwmh9btoLt+U4F/WXcoLw0cJc=;
        b=LCHPzC76mNGnUIpc/LseOPpChzQNELZeyiOuUqc8ETLKv9dZUBpToh00WaDAfmCfxa
         zXpdE8RfC3FK8Nia+Zss6Dz2BcSA/U4YC0YlKITd9MI7Aer/+NyAbGGcS6UksHMLyW0E
         LSMRIvyuQawe2YuMhPXEcx9Jzk1jiitOTDbiFhXTd/kA5PaVMoKgHI+8/YShCUuZ6ngO
         H0zHxhK5JTR3fxtcRWmiiL1fBISCJFh3jRcctmtIYgwTHJqSroE0JTpQnaDlWVD+MWXR
         CHbYtAopa2mEbp6gN4L80hP7wEE+Gvm91XqphdHTaGZOKZNctFz0YJt/7zcPoVCylKm3
         HUxg==
X-Gm-Message-State: AOJu0YzHFaVMMe/PU60c/icdG/qVCesKp80SoJlXvgOuDI6WbXrNQCFn
	cQM0uGD8XYyEdCrQUS0QuLgKW/Q8/SYLGk8VyDnP919DTKA8KoK+YL9JqaK5DsssKjqGNh+F+IM
	=
X-Gm-Gg: ASbGncuFrJhfGn2+KhlNkZA97YHyqiNweBCSw2Wg6RUDdVqrO6DNf6M6Gf4WETR+G29
	SeY5wLxman2jdkarqHAPF2qpss2okkr3dz3TH33N1kPcMEudOgJSmdmknM4kFPGQMN7X1Z4Ykqo
	Xpc+lPC7LG3u0owyaUKSMNVATUlvQsbTxJx8pjMBSVF8umcZtt9Tt7LAx4W2e2p4sv8h2p8msYO
	dwXxEOfOmAURm7yTrWN//JkFFpvZYCxdhr/WBw4Aw==
X-Google-Smtp-Source: AGHT+IHnCu8C/xw3lr+5NN5n4doYHjZBXZKfm5/1S3hdcprbJ5Mtae5qkbTVqaAMAi9kmLq8hv/s7g==
X-Received: by 2002:ad4:5745:0:b0:6d4:180e:e7a with SMTP id 6a1803df08f44-6d8e7128c4fmr42382236d6.24.1733499844332;
        Fri, 06 Dec 2024 07:44:04 -0800 (PST)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d8da9fd1d5sm20046246d6.95.2024.12.06.07.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 07:44:04 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
Subject: Re: [PATCH 0/2] arm-bsp: corstone1000: `CORSTONE1000-2024.11` pre-release
Date: Fri,  6 Dec 2024 10:35:39 -0500
Message-Id: <173349934368.2735333.7239664120078609975.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241204171250.220387-1-hugues.kambampiana@arm.com>
References: <20241204171250.220387-1-hugues.kambampiana@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 06 Dec 2024 15:44:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6276


On Wed, 04 Dec 2024 17:12:48 +0000, Hugues KAMBA MPIANA wrote:
> This patchset contains commits related to the `CORSTONE1000-2024.11` pre-release.
> 
> Remaining steps for the release:
> - [ ] Merge the commits to meta-arm `master` branch.
> - [ ] Backport the commits to `styhead` branch of meta-arm.
> - [ ] On `styhead` branch, add a commit to uncomment pinned dependency layers SHAs and change branch to `styhead` in `kas/corstone1000-base.yml`.
> - [ ] Create `CORSTONE1000-2024.11` tag in meta-arm on `styhead` branch after above.
> 
> [...]

Applied, thanks!

[1/2] arm-bsp/documentation: corstone1000: Amend documentation for CORSTONE1000-2024.11 release
      commit: 5c40c5f7f740a59b669c74da898a3687d53e2d6e
[2/2] kas: corstone-1000: Update the SHA of the Yocto layer dependencies for the CORSTONE1000-2024.11 release.
      commit: 8af2f218d45387851fe870dada856a85d5b98438

Best regards,
-- 
Jon Mason <jon.mason@arm.com>


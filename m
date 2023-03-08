Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B3A0C678D5
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 13:03:51 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
 by mx.groups.io with SMTP id smtpd.web11.6296.1678280624564766093
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 08 Mar 2023 05:03:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=saBfyoBi;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.180, mailfrom: jdmason@kudzu.us)
Received: by mail-yb1-f180.google.com with SMTP id v101so14520172ybi.2
        for <meta-arm@lists.yoctoproject.org>; Wed, 08 Mar 2023 05:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112; t=1678280623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BxZbnBl1i40mMOD457NCXT9zG5iUb1eW0UDBLJDlwFg=;
        b=saBfyoBiEHv9+EFcIYEF/PL61jnHGolFOJa/Br4F0/T6SMkRM3PjzoZ41jQVOabHd+
         6UVAeaaMi5EmlblTp7emf6ZstqbVy8Y97HrA8j2Z4CSoue6WDSLfv8Kb+6SLRiGDCPjn
         tpb2q7G1SglAasf6JRv56FsQDwdAOEK7t74R3LxvB5DIRy5lP7sSVJjLPhF6kiFvxBxl
         MnaXJwpPQnU9FyKwtqqGK9w5h6i37cXPfDMqYSo7YeEMbUJbQRoUjTznXBbbijvVV8lw
         F5LpN0qL7GWv6YrFCSLVTBg5YY7LLbGsSoodeAqUbVYcW/6R+AFpFhB11+NH968Jtxye
         30+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678280623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BxZbnBl1i40mMOD457NCXT9zG5iUb1eW0UDBLJDlwFg=;
        b=p5sFKozsPTfq4z0/Ktv83EcBJ52+DixcBjiwA2VroAiRSb0KaFbOyi1ille7IEM9OV
         sKYVQ0NxKbaQPGXPU5KZXkwE6lixAvjRMQh4UtAKmOpz2f7w1wZ/K6YGmQu+yX6VJhZI
         Y0s5PoPhAeGxfWLi4kNG/+9tNhPcQ8fIKcJTTAQ6agRUDwIT6rIO820GzijgW6FY0wqR
         kPFrP/NqEBrfn3uXo03f/m0rDZieRRECzlgC5JRDDhAn0HnMNSb7zBURVWREcrQGwmAd
         SRemiPMRWgLKXG9f9iUdq8VX0EyWOmYD1qqTA2WaEjikHaq6RpkOWO/Zj7xfifug4gHM
         8/4w==
X-Gm-Message-State: AO0yUKUApcD9wsO8VdA/P8dT3T1ic8b1Lcaa8hG/O33oty7nesq+tbju
	PpnxRDZv3atc7r7tKmsO0QvATwHyizvS+tVyMyo=
X-Google-Smtp-Source: AK7set8b5F/vF5+94iScJT8ejnrLZHAfQPdAeyYqKcYHCFmbofFRY3LJQtMThcfT18cBtHpMf2W1Zw==
X-Received: by 2002:a25:9c41:0:b0:a24:1010:ace0 with SMTP id x1-20020a259c41000000b00a241010ace0mr16341522ybo.39.1678280623245;
        Wed, 08 Mar 2023 05:03:43 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id d82-20020a376855000000b007419eb86df0sm11379875qkc.127.2023.03.08.05.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 05:03:42 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/3] arm-bsp/fvp-base: update to u-boot 2023.01
Date: Wed,  8 Mar 2023 08:03:31 -0500
Message-Id: <167828061270.1577224.10134289787328294745.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230307161650.476217-1-jon.mason@arm.com>
References: <20230307161650.476217-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 08 Mar 2023 13:03:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4481

On Tue, 7 Mar 2023 11:16:48 -0500, Jon Mason wrote:
> Update to the latest version of u-boot.  This requires removing the new
> way DRAM is handled, since we don't use dtb the way u-boot is expecting.
> Also, change the default bootcmd to make things work (as that expects
> env things as well).

Applied, thanks!

[1/3] arm-bsp/fvp-base: update to u-boot 2023.01
      commit: b55cd3d627627f6c3ed1eb95043735af75ddce79
[2/3] arm-bsp/fvp-base-arm32: remove support
      commit: e7c5876380968f1fb40a0f2d9096bfba8c78c09a
[3/3] ci: add external-toolchain to qemuarm-secureboot
      commit: 4bfa191ada5c44baaa1f4b8aabbeb314961c0134

Best regards,
-- 
Jon Mason <jon.mason@arm.com>


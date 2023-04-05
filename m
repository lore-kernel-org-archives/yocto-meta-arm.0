Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2467DC77B6C
	for <webhook@archiver.kernel.org>; Wed,  5 Apr 2023 22:29:01 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web11.144811.1680733734364374927
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 05 Apr 2023 15:28:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=AIF8hYjz;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.169, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f169.google.com with SMTP id t19so36474932qta.12
        for <meta-arm@lists.yoctoproject.org>; Wed, 05 Apr 2023 15:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112; t=1680733733; x=1683325733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d9wWP7CKbPmL1FFO4AMhw/kLhfabTBc4kyAUrR/7h1o=;
        b=AIF8hYjzXv/kPt4h8kjk4B2YI/m8Xc2y6tFe/iWxIWcTk93m7gzY3LZy5autopalWw
         KmZl4D+8TNgqa29hbiH9q/3qwf2cwD1OjM69jaNv9nj64uGGAYaXGm0lZBhnMxBPvsol
         R8dBVH3HKQwkMHE+Fw6puFR6J9gMtxRUMEQnY4Ygq8ZVgheO4e2XDw2nVScigIOAVido
         5514D4BRPZoeNtIcaJbVmCgO+MGO+vT9DBOvJrzayYOS8aRk7pStuOy+AgIy5k6THwhT
         GGK39IsxEoRY+5+dt9kCHzOL8FFgdeaTaIVVCSDfKFA1uDnUar1W6GNqT/t7sf+WV0eo
         EFNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680733733; x=1683325733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d9wWP7CKbPmL1FFO4AMhw/kLhfabTBc4kyAUrR/7h1o=;
        b=Mthr+U3gk/svpbORCHDj2znoTFnlXCba72PC+sZX5VRC+DOCZZumCU0WUsvT3xNH6R
         DdQ2D1PVy3GJlGzexFeuYJlBoH+a6M+s7lM5I9q384l2ZCkMzJotzRkAUiuYPRS/p+lV
         TlJxaSHV6zuFIewuekOJJ1OhafEUshzne2U1zZgJePaVM3eEKeAMDtsXFqiF33Vnoj/5
         aXlMqbxt5WvQp2FIpVbihg1cFVCZgybkYTwWx6Vj51lbma7ZnyEQ9E4XitACZzVBu3OO
         +LdjzvPpf55rtMXAu8fCoCtoy0ZcvddjjJS+w84CrCbS3qj//qv5CKTOpmi4fdMMquGd
         NPeg==
X-Gm-Message-State: AAQBX9cwH/17CATgI21SIZRwNfAkEO8d4wH667nT7J3ebICCpVjwiy1M
	RnB6XrAsgU+gGCzI/oi5z/8+QEyQYTvY5C99CN0=
X-Google-Smtp-Source: AKy350bQq+/p4U3ZBaXW9jmd8abWj8MJS6MZdPOSXozdE9k+V/Bo1DFgsst2UlE4bmzT5ld6sdLF9g==
X-Received: by 2002:a05:622a:10d:b0:3e3:8a84:bc51 with SMTP id u13-20020a05622a010d00b003e38a84bc51mr7955309qtw.19.1680733733099;
        Wed, 05 Apr 2023 15:28:53 -0700 (PDT)
Received: from localhost ([2605:a601:a600:7900:15a6:cff9:108:de91])
        by smtp.gmail.com with ESMTPSA id d14-20020ac8668e000000b003e39106bdb2sm4316648qtp.31.2023.04.05.15.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 15:28:52 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>,
	Rui Miguel Silva <rui.silva@linaro.org>
Subject: Re: [PATCH] arm-bsp/corstone1000: tf-m set/get fwu, private metadata using gpt
Date: Wed,  5 Apr 2023 18:08:38 -0400
Message-Id: <168073252006.3261602.2003341900237381362.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230405141919.334782-1-rui.silva@linaro.org>
References: <20230405141919.334782-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 05 Apr 2023 22:29:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4550

On Wed, 5 Apr 2023 15:19:19 +0100, Rui Miguel Silva wrote:
> Now that we moved in corstone1000 to use a gpt and partitions for
> the wic image and flash layout. Setup TF-m to set/get FWU and
> Private metadata using the partition information (start and size)
> stored in the gpt table instead of fixed flash offsets as before.

Applied, thanks!

[1/1] arm-bsp/corstone1000: tf-m set/get fwu, private metadata using gpt
      commit: d2661fa7c0ae1a66dc29ae9b5d074ac81c7250d0

Best regards,
-- 
Jon Mason <jon.mason@arm.com>


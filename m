Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05B4FC433F5
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 20:30:13 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web12.1639.1652905810914246221
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 18 May 2022 13:30:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=MKsRRxRM;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.181,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f181.google.com with SMTP id m1so2465305qkn.10
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 18 May 2022 13:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ED/esTyW+25NT2A0f7FTNy9jGUqAjv/yoA9M1J/Sx3U=;
        b=MKsRRxRMZfnAYnZuImgow3UmLaWdeQ49nznwfS44/Zu0D3ss08mu9v0tdcMpDwlMTL
         +kwm3uDToe7RP0toGXXYtg30WQ1/33CpY0GgsQGIFQBUtr24vqxhL7bI52ePphrj9I1H
         QBMWm25LL7y2mbfduL3iWf7MekTF0orpnwZAO0UlMXxeKz3Gn5Ba7IsksNJsh6Z1hCLK
         JBTHOtgtKW5Wc9E+7G4mDaHb34RY6WnuNb6d5KW9YuTNWgnkP7RhLMbIo6L0UVuU2Jic
         biTLgIU1ElGOIe2sZNyvC37YpjhouMeFgOLZVGiQx/b4CmuOJhFHe/0YK26ZBjw/I2Ef
         HAuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ED/esTyW+25NT2A0f7FTNy9jGUqAjv/yoA9M1J/Sx3U=;
        b=N0STk7RfjWDvFgjU13RGukgioecr1t85VHH0r5WWHLwyIdUqbCu4x8wWvfzYRgpA/q
         5n5b5Y00dHb0fcrHM1jeJID0u0YKKBsOOgAhtSmVAzfRDHnohUimrLltt1EB3lJXvZpN
         L6CqM715IeiLJJC2jAYSPXhgeVi92Pfa2SLbLl54wBGGdswndSmoTEXYp2kE1dyWd1l4
         EYwx/6h99jokPKhakJLC7pC38vsARscm6eMjgaqt0Gan6y32y5wJ82lFI5Th7Oq7JKUn
         owelUYU0lisPWpdRneGl4fZmQ6HO6Ey63b+Z21vGDlMjFX5I3w66QO1aIOzSCyBRnM1T
         TjQg==
X-Gm-Message-State: AOAM530D2Fdb2DP/W7HJMan06vTHNTFtz00MJg74ZZJwaDkmOCjWLfFK
	j9pGRib+nAnEbCAggvmdlm1btVb3Sdtt7nFx
X-Google-Smtp-Source: 
 ABdhPJwR58HuokVEIHo15rRYxIiIsJxFRRtnOZDEAaIlSOSianVFaY88KBKvslkfd68+GwQrgYchhg==
X-Received: by 2002:a05:620a:22c1:b0:69f:9c48:11bc with SMTP id
 o1-20020a05620a22c100b0069f9c4811bcmr922338qki.155.1652905809907;
        Wed, 18 May 2022 13:30:09 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600:5336:1ccc:fa87:21b2])
        by smtp.gmail.com with ESMTPSA id
 t19-20020ac85893000000b002f3e2435ee2sm144415qta.63.2022.05.18.13.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 13:30:09 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 1/3] arm-toolchain/external-arm-toolchain: set the version
 in the recipe
Date: Wed, 18 May 2022 16:29:55 -0400
Message-Id: <165290579643.1529019.10881633465565688197.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220517122818.3324458-1-ross.burton@arm.com>
References: <20220517122818.3324458-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 18 May 2022 20:30:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3441

On Tue, 17 May 2022 13:28:16 +0100, Ross Burton wrote:
> We need to support multiple versions of external-arm-toolchain, partly as
> different versions have different layouts on disk, and partly because
> 11.2 doesn't work on pre-Broadwell hardware.
> 
> Rename this recipe so the version is in the filename, and dynamically
> set PKGV instead of PV so PREFERRED_VERSION is easier to use.

Applied, thanks!

[1/3] arm-toolchain/external-arm-toolchain: set the version in the recipe
      (no commit info)
[2/3] arm-toolchain/external-arm-toolchain: add back 10.3
      (no commit info)
[3/3] CI: use external-arm-toolchain 10.3
      commit: fc09cc0e8db287600625e64905170a6de24f2686

Best regards,
-- 
Jon Mason <jon.mason@arm.com>


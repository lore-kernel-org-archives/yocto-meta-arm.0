Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57B97C07545
	for <webhook@archiver.kernel.org>; Wed, 25 Oct 2023 01:33:44 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web10.164598.1698197614499638619
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 24 Oct 2023 18:33:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=dZohYoZN;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.41, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-66d17fd450aso3069676d6.1
        for <meta-arm@lists.yoctoproject.org>; Tue, 24 Oct 2023 18:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1698197613; x=1698802413; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ba6/6R6hm7f0XJPT3ZbHsBzz+MO1TEj21jMjH+vmxMk=;
        b=dZohYoZN9gRrUWjS+keis/rFkTMP1AMqAcpMtrehXy6Em+qIqdzcAmOKstyqbkS3+T
         yzIyoNAiRiY8ZKrqwbP3Y8T4eyqR+77eF1ebjomM1zml9yD+mfb1sQTxkKXAHXM1VCxG
         FYqN9ivLhI8MDRLEARrHYWHzaTzScoenLJjKWY/5mbS4tHUltnzgIuLt8tKaZM3g27/2
         cwbBVDgYxw9iUrfif1SZZJ6rOo73blhlpYbA+bxxsvyvOtunx6Z3J91Vpm8QvqsQfBin
         gcRp84jytS83S5gDEL5NUSl1UPcuH6XULhjySH8jEmEZkEMGjQuNOLDNzMN0WqDHB4Qj
         EjFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698197613; x=1698802413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ba6/6R6hm7f0XJPT3ZbHsBzz+MO1TEj21jMjH+vmxMk=;
        b=kxcctMriyHk5+3aA3AkcKEDBkuf63C5FVrjow+gGAZwfLVsaQGXUdLMDNQv7UPoRD+
         5zGJyvorRvlcSjxts9IY5wAG4PVbi8LOtHTb60t+mpbTF27c9eH5a7U++vDwYcLJfM1a
         cEeo/KQmIn4GMWecVttcjfuYtHWWNDbBrwamuh01W6TdShaW+uii/sE13hZSMlpndexw
         O/gCzoBHh7gLpFJRWYy8NGDCMcGtCqTlwNt548PpFpqTPbYyvZdUZIR/NtSzwMRIzbIJ
         YXrldCoSsZe//GHZ+p0fxkaqZ7+3demuevlNXrK8EsmTV7OJEj9nE0gxttwoyfrw60Dy
         apdA==
X-Gm-Message-State: AOJu0YzdIKpBaiuxmQwKkJzIuGjazpZp0TqSmYug/Vl8ZBecTOXTZHKS
	Xt+22oSkbk58TVE+ejnUF2ODvIb5dsJeVdG98pQ=
X-Google-Smtp-Source: AGHT+IGf4uD0SSiFRPzDGRk3kaIhNjjJwf06Vt9NN2HzFR8Nrdskwlhd+mP6FopjZd1s4B5rhl1TbA==
X-Received: by 2002:a05:6214:18ec:b0:66d:593e:7722 with SMTP id ep12-20020a05621418ec00b0066d593e7722mr23802532qvb.3.1698197612989;
        Tue, 24 Oct 2023 18:33:32 -0700 (PDT)
Received: from localhost ([2605:a601:a684:4100:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id t16-20020a0cef10000000b0066d20f29e5fsm4042480qvr.35.2023.10.24.18.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 18:33:32 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	ross.burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 1/4] arm/fvp-corstone1000: upgrade to 11.22.35, add aarch64 binaries
Date: Tue, 24 Oct 2023 21:29:18 -0400
Message-Id: <169819735776.1892682.4737243583528581249.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231024135236.3510412-1-ross.burton@arm.com>
References: <20231024135236.3510412-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 25 Oct 2023 01:33:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5169


On Tue, 24 Oct 2023 14:52:33 +0100, ross.burton@arm.com wrote:
> Upgrade to the 11.22.35 release of the FVP.
> 
> Also add the aarch64 binaries as these are now available.
> 
> 

Applied, thanks!

[1/4] arm/fvp-corstone1000: upgrade to 11.22.35, add aarch64 binaries
      commit: 4c27c5fe257d5cd24bbe0c76de43e4b199114dfc
[2/4] kas/corstone1000: don't limit the FVP use to x86-64
      commit: ef47c87dbb2f9f5d65068cc2f82aa595bf1c6baf
[3/4] CI: don't pin corstone1000-fvp to x86-64
      commit: 7309e2683bd77e4fe20eda6876a0ffb78f8eef7b
[4/4] CI: build both aarch64 and x86-64 packages for as muny FVPs as possible
      (no commit info)

Best regards,
-- 
Jon Mason <jon.mason@arm.com>


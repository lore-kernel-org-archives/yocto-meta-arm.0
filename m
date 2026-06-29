Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B676C43458
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 03:54:40 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30465.1782705271445335101
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 28 Jun 2026 20:54:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20251104.gappssmtp.com header.s=20251104 header.b=tXqty08s;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.180, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-92dd78e97cbso157768785a.1
        for <meta-arm@lists.yoctoproject.org>; Sun, 28 Jun 2026 20:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20251104.gappssmtp.com; s=20251104; t=1782705270; x=1783310070; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AEkQbV+Q8OfbjKIKkkWmWcRmW83uGNXa4FLbmUvgCrU=;
        b=tXqty08stWfRGKIImaLb+iA7Q/TdMw9HSGVb0gHfePuJk6Js5wYiqYNFnM6Par3yTZ
         uaUWdyzMnq6+/6Em5XRhjr59Vrp3GjkDMo6Xox4Ytwwvq3SQP6iWkK14hFG5/o7ecBEh
         CfxNGahLhUu6aXBU1FLhcSgVZ0KdcMCOf44MUN5hJR4Cwzkt0Zk2dCWNOJv6YCLWny5S
         auliDJIhc3jdfq/b6Y7xANk2R0y+VJ0lmmSXEn6pl9rwaiqjM243SUzAfFWcAU9EEkrl
         OYqTZBHXxxY8rIpFDnZI7JstipoLM3DcncWVzmlEzat7TVPKD9T5dxgV77wzdssFH+FE
         IJNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782705270; x=1783310070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AEkQbV+Q8OfbjKIKkkWmWcRmW83uGNXa4FLbmUvgCrU=;
        b=B9o/VQtavdrBWlCGxDXhk3oQg43gR/rfP8cDyVqXD2uxzWqoAA+RCeE4RN5r33KFqU
         mf7hq0KLi5Z5TPxkPfGfIJaHnBCW/TLqzoG4fmfBaf5Suc1viUsaOoPhA/T5ryjT62aU
         XHxz6aOARrDwSOM/ZJpzm29O/nScyWBZVT7uBgkZrWdP1EUMg6BxtpsxAoKh9hRlfAzR
         iKoTvapVBUCc2ImhF9C34njbSojBGC9vyPCrwly0lPor83z5ewehqsNz0AZehcBhOT7U
         ddgyMrYxY/nQ4GBAHywjlX6RoixXwQnt1Vmly4KsKShdm88yJ9APss69daBCqn9dGdMg
         4gDQ==
X-Gm-Message-State: AOJu0Yz8XsSuZKsrg/udxmKL7xncJo0R4dS8FvDEizIKjpsPzLUsucX8
	l65cN+QCilpTJ8kHocCtZv/7ISiv6gd8/zIstRyJuHc2pdN+RDk7vQoSOacAhm6pwjaulQasaX/
	xKDNCPQ==
X-Gm-Gg: AfdE7cn8aTYIR2EzSx08RkBKudE7amhLLpJrnYXv6ykrFmSHjnyLFD5riMD257UKHh9
	tBry9mLiiXCwvGbrwFpUisjLr+Q0l/k2VwrJlo/Bh0LbZl79B+bGUDjA+VphtCIa/1118OSlJCb
	w7t8IbWqd2L3kGYKCj8TtbkZAe8cQeyZYpXAeAX5h2OcpmvzdCTZXTNQZ3h/q6idLselasvORBf
	9ZtHn7Vv+rB6FLKA4Wrxwd8oe/6N10nfyeRvPIrI4hpUIZZElQMKkKatCmObjw6l/JI2An59mNK
	jeQKD4lu9nbjJyHOFd24hCTu2IYR+5FbF5T/v8LQoKWsUSMsAFa9N2ytBOBqkSoMC4MFL0zviJV
	+xsPI5dln4bU/Ckf5HHzD8FTqvB0iXOsxOSiSNcIZou4QhIuCm5wDxxXILAuwRRtmMAT30wvBGm
	r8tqRgtgA5IEw5
X-Received: by 2002:a05:620a:a11c:b0:92a:e474:92eb with SMTP id af79cd13be357-92ae4749eaemr1185628685a.55.1782705270021;
        Sun, 28 Jun 2026 20:54:30 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e53434e85sm161651185a.21.2026.06.28.20.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 20:54:29 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm/u-boot: fix uefi-secureboot on u-boot v2026.04
Date: Sun, 28 Jun 2026 23:54:08 -0400
Message-Id: <178270524877.1308166.1058837502324162437.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260625210020.29112-1-jon.mason@arm.com>
References: <20260625210020.29112-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 29 Jun 2026 03:54:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7097


On Thu, 25 Jun 2026 17:00:20 -0400, Jon Mason wrote:
> u-boot v2026.04 changed to kbuild 6.1, which broke how ubootefi.var is
> used.  Apply patch from u-boot mailing list to address the issue.
> 
> 

Applied, thanks!

[1/1] arm/u-boot: fix uefi-secureboot on u-boot v2026.04
      commit: 9977e1abf2f379716427f51fb27d68b94133d26e

Best regards,
-- 
Jon Mason <jon.mason@arm.com>


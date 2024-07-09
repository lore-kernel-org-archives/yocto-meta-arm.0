Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C988DC3DA41
	for <webhook@archiver.kernel.org>; Tue,  9 Jul 2024 12:45:39 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web11.12002.1720529133331817500
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 09 Jul 2024 05:45:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=A+JFyuma;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.171, mailfrom: jdmason@kudzu.us)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e03a6196223so5523626276.3
        for <meta-arm@lists.yoctoproject.org>; Tue, 09 Jul 2024 05:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1720529132; x=1721133932; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yE/98dWp9sClbFUs5lDSb7PIg5RCGnZMz84WiWz/cjI=;
        b=A+JFyumaqe1lCR0MaMo8DcyMzsdUmoeZkcUUyFFyLdveEc3vmQoCbqGuOLnPrIkiPU
         plTbbjjcySbiZNmOP1DnpraQBpOr1bqOTqoJPzFUhnurC40kPHJX7ZDiCuqmiHCLj4M4
         s+qOQoaejadtBt04Vx2kYzGGP5JFwxv9HRrwUEe0W7t/97gk11gW2n/UFA8oRFSI8ApI
         LiWE+noHwMRlzFWfBKivvQVfybdSQwGXC9lWo5zjDPCt9xEH88Z4TfHFag/OlIi//wUD
         Z6qrfxWfCNM8Ivfrcrq2lB0e8m26/lzs8FwifPacWq3ZGwoNvKbWGOCXfWWwsSjpFOZw
         hsrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720529132; x=1721133932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yE/98dWp9sClbFUs5lDSb7PIg5RCGnZMz84WiWz/cjI=;
        b=lAAbVkCj8wVwv3JZ+l80Qg+7kXGKq0TaSAzxNnazojYAmO2TKqyq5D1ZsSKWzoDBv1
         w/AmVvSoIfO/Bu7ti1zw/Yc78/C3ntnxjgI2niWBYycOrDyBOlR/P6FBUrpkG2yCCfrm
         9SI2IAkXpuH3EBGaDUEOfSvawg++/UVO7W+NuwT5Hp4SY/scn5cj53DEZVyVwZly+YfF
         7EDd+BlZmu4YfOIf5Zr/WbCCtmsKJVoASquDaHhAlLSXVNJxaNqJsqd5vG4z20zpLTWj
         pa6ekR4u1KZELhlWwF9Hc4lg3J5yfMvz4mmSUojJF2yp9cUxK/WuRH7RYFLoUyNwhqtj
         rfZw==
X-Gm-Message-State: AOJu0YxT3QCd5UiKZEJa9cx9IEpWkKDqO2rw4hJPwMLwgjTWg18DqvlB
	KNc/6KhwOzftH33SbryTJ/8PgxHxE2mtMfYnUiNDlE3BRW7BdSkZEzEb9ZtvXHmWh8YXiFjJA7I
	=
X-Google-Smtp-Source: AGHT+IH/SOlVZzQr7/9YkSNbHvHPfn+xEtyKsWbTDg8o1aMNzytseKtdN6AWzJeF5OgBPAEKgy1TgQ==
X-Received: by 2002:a25:a369:0:b0:e03:48ed:d275 with SMTP id 3f1490d57ef6-e041b173dfemr2833688276.61.1720529131436;
        Tue, 09 Jul 2024 05:45:31 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e041a981394sm307123276.42.2024.07.09.05.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 05:45:31 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	bence.balogh@arm.com
Subject: Re: [PATCH 0/2] Update OP-TEE OS to v4.2 for Corstone-1000
Date: Tue,  9 Jul 2024 08:45:18 -0400
Message-Id: <172052912046.1983569.13992399652018542955.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240708115500.660234-1-bence.balogh@arm.com>
References: <20240708115500.660234-1-bence.balogh@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 09 Jul 2024 12:45:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5871


On Mon, 08 Jul 2024 13:54:58 +0200, bence.balogh@arm.com wrote:
> From: Bence Balogh <bence.balogh@arm.com>
> 
> 
> Bence Balogh (2):
>   arm-bsp/optee:corstone1000: Update optee to v4.2
>   arm-bsp/optee: Remove OP-TEE OS v4.1 recipe
> 
> [...]

Applied, thanks!

[1/2] arm-bsp/optee:corstone1000: Update optee to v4.2
      commit: 9532dca1a680654edbc776cdd0e5ae6fee6328ad
[2/2] arm-bsp/optee: Remove OP-TEE OS v4.1 recipe
      commit: 0ec9dedc00b9089d4076e475fab667d272ac23e5

Best regards,
-- 
Jon Mason <jon.mason@arm.com>


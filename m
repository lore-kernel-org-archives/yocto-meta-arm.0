Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 823C6C47077
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 15:02:45 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web10.16828.1705417362078423360
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 16 Jan 2024 07:02:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=Tnmodq4x;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.169, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-42993124fa1so60418021cf.3
        for <meta-arm@lists.yoctoproject.org>; Tue, 16 Jan 2024 07:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1705417360; x=1706022160; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MjMfO/lWcnWYew69Lb1tFlDSru9BEF8Hbv20pzq5UwM=;
        b=Tnmodq4x5bjxOcZpDeppN2Ma0gB0tfAvg+ZKnemOqtNCZk0FIqtk9hfkHH3w3p1RzJ
         L4H+YW2JHXmqzTOtonXUSDY/fawO0knbGdUygAmIXQ7lpHgLqm8wv8Lv1TT1Jewhxw+A
         V2kZCaPDQwwY7TwyldvnDVDSt1EqjOwcQfgDYOLLYPpU5lfls5mnFlrfrtVsGlrEXOfd
         q/cI3U5OXqvWHjzK6v1VNCau/oggAL6Z82/EC+97cfGQIinT8nB0FDUozHBrjYCTBg93
         EM9TRsvEfGC6Cpi2ED7HuAEJbOOmLWzbDG5DYTg/ynt9E9pYipM7UIxT1XG/HANDKzOL
         IIpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705417360; x=1706022160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MjMfO/lWcnWYew69Lb1tFlDSru9BEF8Hbv20pzq5UwM=;
        b=wIxoPbPXbclhJ2fHDz1enKW6qRW+B3LtnYNzlDL/fxV9yrstTRkQzrQj1HKvOBKKFP
         7AacE9NHYnzgq7aO7PcaxOXwL9u3vJBvurz3XpipoZ5tr4R8ruqeu3JoLqsOkAkVu6KX
         Ye3WeAn73OonxJuHdfSFnfzNz6kmALm0bLuEWrDA/k4sbqJpT2dgHhOd5ZEqHTkupERG
         QdHHneCWtE6xXHL0LjqONilT/UD//bXYsHUdbZFYH+7Fs6qYkuogrYt1K30yDaIp1CVu
         STwNUnuhLtIbLSzGnusMRmkJZhZP6tg7x6j6GdxLV6b8pmidGW18XrTfp45FVDVlK7Cm
         mJsQ==
X-Gm-Message-State: AOJu0YyA64cdqFna5Hs8CVLpfp8/8RSdoGO05rbvdk/VRDMFM77mKrD0
	qq2c7sBMxmaCSbBXTYQCpJwwEWCu1uTD3KvVD9Ahrwamaw==
X-Google-Smtp-Source: AGHT+IEhD9wAeYQufbrsl30yzb5jCoU3+vyzIv2frRlfKtKVE/MqVDdOmvjJ9DK7yAhihI68Oy2qNA==
X-Received: by 2002:a05:622a:446:b0:429:e742:46aa with SMTP id o6-20020a05622a044600b00429e74246aamr5114633qtx.85.1705417359974;
        Tue, 16 Jan 2024 07:02:39 -0800 (PST)
Received: from localhost ([2605:a601:a6b2:2400:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id ew6-20020a05622a514600b00429d2951d5dsm3809332qtb.72.2024.01.16.07.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jan 2024 07:02:39 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/2] arm/pyhsslms: update to 2.0.0
Date: Tue, 16 Jan 2024 09:54:14 -0500
Message-Id: <170541685620.1939555.8410226177804494151.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240115230807.79347-1-jon.mason@arm.com>
References: <20240115230807.79347-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 16 Jan 2024 15:02:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5334


On Mon, 15 Jan 2024 18:08:06 -0500, Jon Mason wrote:
> Changes were needed due to the 2.0.0 version not being available for
> download at pypi (though listed as the latest version there).
> 
> 

Applied, thanks!

[1/2] arm/pyhsslms: update to 2.0.0
      commit: 8127e49f6bdba89a43f9c8c46d9116af3628622a
[2/2] arm/trusted-firmware-m: update to 2.0.0
      commit: c538ae49eea67a7ebcc9d77137a459a4b68edcf8

Best regards,
-- 
Jon Mason <jon.mason@arm.com>


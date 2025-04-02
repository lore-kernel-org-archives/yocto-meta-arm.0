Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB83FC3601A
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 03:33:51 +0000 (UTC)
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.web10.5171.1743564821984218335
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 01 Apr 2025 20:33:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=zEIcjSaL;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.66, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f66.google.com with SMTP id 6a1803df08f44-6ecfbf1c7cbso39751926d6.2
        for <meta-arm@lists.yoctoproject.org>; Tue, 01 Apr 2025 20:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1743564820; x=1744169620; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L9hAGtUf497ARNwOokLiEHQAmO/WoluVQfjDGj0vV+I=;
        b=zEIcjSaL/DbIq9CBUwgUPEbDHiaYyU4Fnme/PFBO1Btfij89h82oIpl4qu0d2V6n/t
         7ebPa+lG7tk7znh+daf+Aq3heSm8rxmIbhc1XYrLyilynGtlV5rFWrSnekI38ObrqK16
         2j5ZcXu10qeL3AKtqxrMDwhvZfBzlxtoP/txVKObj0m9xQU3VUGqfME6mBnUzMAvTSoW
         6Or6I4CvMzvc77gMz7/x0IlS9DAOn50/BluF+bIbkfPkU+CjqUe5endbf7VB7/Tfvk6A
         fxMovU86aiRLk4Rf7PA07o/JTNTLe7Bzle123j/gUE5soLMK3YL21VwPzSrR391yoQuB
         I3MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743564820; x=1744169620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L9hAGtUf497ARNwOokLiEHQAmO/WoluVQfjDGj0vV+I=;
        b=XnCDEYZFGeQHRFIAksPv9np1lZFrRiWx2Lz8EYIoJjTAAFX2JFcgufITb9DiY+M3GK
         n0fcXETrOQVINl7QMkM42j1SfcFkz91J93qtf6fOwGB0FfWp/Y/Q84Ez1/pJ8Wic1aa1
         KbltU69ORv9HicGlWFtNve1uSiQtqJz3I5simbrHnVDvM021IQLivo/rQqt1QD9KAzhQ
         9oObpxR52Zi8OMEgWlg7jQEGR7EstT1bXIoI2bz8CZmgyFkRA8avw0LJF6Mf8MQE9wl3
         Dh8czyr9pj3ETmCq4Xw9rhDUPxF9RrQjNrFkCTwSiS2bxtEF0FAIlTnC0HM9FGxq723w
         Od3g==
X-Gm-Message-State: AOJu0Yz3gM8Pfk2eSgiDcHCrO4nYFErjZohnu+LSP5/LbFx/k69eLNYQ
	f4NlLScESCWBJ47rCI7dh/HIQRNZUdcRvy2vH2pU/VfZZYS4cPhnR1xxucc2goDBcMY1feD+dtv
	kncEt
X-Gm-Gg: ASbGncsEV12PsjLEiseUCO4trAt2KM/zfyPkOqrp6iMYlVztJchJzMRiuXcIyMzIYY9
	cvqG7EXgY16LxlkxivjaehTwNTHtNJrOXRfwx4OuxHhdbQlu2RsqedT4RarSmp1OBNUyu03/+U0
	JN46WqpjlT/YH6OsFhSKsrtB7xUm0d8+INed8psNlO+dRHbuQVe57SPAA+zRXnct/SkgKq6/G8F
	BzLVvU90pheqAc6kv1cr/4UJlKfipg+hJXSKssjwhJ/Rgk4uw4qKIHuiUDSeQVY8CpcfdgShY9L
	V7O9pTzrSTB8f/LVE5hIOAlVq7E9MNv3P+NR
X-Google-Smtp-Source: AGHT+IHyCMr9NW240R2AHHJ+DtIFm481NzAo5LNHajgjWC8iOXVvU5VWZEDOZgxMJzuKEc1Eg5XDuA==
X-Received: by 2002:ad4:5b8d:0:b0:6e8:f99c:7939 with SMTP id 6a1803df08f44-6eed626cf99mr187108236d6.44.1743564820534;
        Tue, 01 Apr 2025 20:33:40 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eec97974ffsm69729266d6.99.2025.04.01.20.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 20:33:40 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: Re: [PATCH v2] edk2-firmware: fix SOURCE_DATE_EPOCH
Date: Tue,  1 Apr 2025 23:33:16 -0400
Message-Id: <174356479871.2646952.5762787229553486993.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250401082525.94287-1-mikko.rapeli@linaro.org>
References: <20250401082525.94287-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 02 Apr 2025 03:33:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6432


On Tue, 01 Apr 2025 11:25:25 +0300, Mikko Rapeli wrote:
> edk2-firmware build scripts use printenv to print SOURCE_DATE_EPOCH
> but that is not in HOSTTOOLS and thus fails with configurations
> which use VirtualRealTimeClockLib. Change to using SOURCE_DATE_EPOCH
> environment variable directly to fix builds. I think this is OE
> specific build config change but filed a bug report upstream
> https://github.com/tianocore/edk2/issues/10910
> since the fallback mechanism is not working.
> 
> [...]

Applied, thanks!

[1/1] edk2-firmware: fix SOURCE_DATE_EPOCH
      commit: 629fc5429082ecbe9e082766819100c56e4361a0

Best regards,
-- 
Jon Mason <jon.mason@arm.com>


Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17893C77B7C
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 16:01:27 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.422.1683820879839054183
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 May 2023 09:01:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Yo9gRgb6;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: peron.clem@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-3f450815d0bso25539835e9.0
        for <meta-arm@lists.yoctoproject.org>; Thu, 11 May 2023 09:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683820878; x=1686412878;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N8GJDz4wY3DIRXJh5aExjkOA3KN1L0HPHDUjFryyA7o=;
        b=Yo9gRgb665VnLSx1kUj7kMx/ItgCvhlBNJv3Aet2HGOahCi+dHZ6r+vJAAXHctpfv5
         5tdHduKIUz31hMCjF2HWVYaFhIb/DjGOA53/9iUTi5MiRy8lX8A/KjPl7SN+SOKZ2xUh
         44tvkZ+7gwO2FeblhY4xncaLZDzezt2ZpImJ2De9d7Gpp6VITyokwqbDBmRaspLtrOPX
         lr6DDQQ95zWpWsYhAN4Mb977IW5NBxhYwRS6SwF9YKWO8aNujxPrjmQyj8iH5YIR9IHz
         hS72M7a+ItRBBpmJzF6C9Dg5ZAYI/Jya0UiJL4v8BOi+CB40wuqkjU45aAZQ9G/v73NL
         62ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683820878; x=1686412878;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N8GJDz4wY3DIRXJh5aExjkOA3KN1L0HPHDUjFryyA7o=;
        b=ihm8gbcVL7hd2NpK8QthESxcMb9ZKixlcnb5MJWmlldwDgwrFt4NtGVhizA6oNVHtb
         8D/Aexcs5lGkFEku6GbxkeuLJhyh5GVH1lrd099GuMUCpqw5f+3qfdOfHq7w2jBz99iD
         rFmnKUZZ1nuz0i19dQXHbHNDF9J6qKTLh0e/VvQPl3oronZyNyZecsJBpjhS81JSX16E
         /475yRlUGDsiejJuVhNT6JQGY7PYr8jxDCr8L0QfIPDoIvZZKV0Y+OK+Q1alyUbGfs/U
         9vu5wGPA5SJZo/15X0zXJpwcqmMsOmXfQh+mWgKle8Tk1UbFIlQNZzU2GNqdL91Qju/A
         mkaQ==
X-Gm-Message-State: AC+VfDx5FM1h5h7eFGBU8so51TvqGTwuBwOhOg/BakPhBj1NpsoEjFsu
	xq9YX6pNt/2uZ9QGLiDBSbd8Eet1/ugjdg==
X-Google-Smtp-Source: ACHHUZ5EcQ3ZAiyJDmMrEOru0xlAflNJb8CzLj6tJOD9cs7eYzIE27TmT1pieeVoowKbAN7azDYxKg==
X-Received: by 2002:a7b:cbcc:0:b0:3f4:21ff:b913 with SMTP id n12-20020a7bcbcc000000b003f421ffb913mr10807130wmi.40.1683820877715;
        Thu, 11 May 2023 09:01:17 -0700 (PDT)
Received: from Clement-Blade14.outsight.local (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
        by smtp.gmail.com with ESMTPSA id w12-20020a05600c474c00b003f07ef4e3e0sm12689904wmo.0.2023.05.11.09.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 09:01:17 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [RFC 1/2] runfvp: switch working directory to allow path relative to fvpconf
Date: Thu, 11 May 2023 18:01:15 +0200
Message-Id: <20230511160116.398793-1-peron.clem@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 11 May 2023 16:01:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4641

fvpconf file contains absolute path that leak builder path.

Allow to add relative path by changing the chdir before loading
the config file.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 scripts/runfvp | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/runfvp b/scripts/runfvp
index e4b00abc..f0d821be 100755
--- a/scripts/runfvp
+++ b/scripts/runfvp
@@ -87,6 +87,12 @@ def runfvp(cli_args):
         config_file = args.config
     else:
         config_file = conffile.find(args.config)
+
+    # Path inside the config could be relative to the config file
+    working_directory = os.path.dirname(config_file)
+    logger.debug(f"Switching the working directory to {working_directory}")
+    os.chdir(working_directory)
+
     logger.debug(f"Loading {config_file}")
     config = conffile.load(config_file)
     start_fvp(args, config, extra_args)
-- 
2.40.1



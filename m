Received: from mail-yw1-f67.google.com (mail-yw1-f67.google.com [209.85.161.67])
 by mx.groups.io with SMTP id smtpd.web12.5555.1583924809552796647
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 11 Mar 2020 04:06:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=hx4CEbUi;
 spf=pass (domain: linaro.org, ip: 209.85.161.67, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yw1-f67.google.com with SMTP id 10so1573401ywv.5
        for <meta-arm@lists.yoctoproject.org>; Wed, 11 Mar 2020 04:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=efcf1kf+JDdTU55T5mYjOmXplg67wuZmadvkPFG8GZ4=;
        b=hx4CEbUiJSlNiiXM/ALQSsOS7RLrI0aQrbKzdmoc6NDkYbsol9AG0NCVc1VMjGx/6d
         O4aduzI7aGBAddYmRRn6Zs04ubWMkPDNQHruCxklOt6dkV+TALzJiolSlowotLqQm/Xg
         YuMfLqQnPZQbl35PGPjMLFZ4cs47LYDyzyvW+8pOjswDsUBR1TfW1XXHWX5eiIXhNlV/
         1JANKyE4uAiba6OQN9Cs9lZ3UWzlxwYIbZedlynIecEdeC+S9F03oPqNwEOqSRbRidkA
         GOUWrKJanAKGT96V/jfaxjedNfUKVNhxNCQZpZMa7sfjHHDDMf1aTPgqAKSIJB9OSMtE
         3jiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=efcf1kf+JDdTU55T5mYjOmXplg67wuZmadvkPFG8GZ4=;
        b=rjwz08enLJkeO3gi/6oxsV/JTluxTvtT7cgv03OxdZOTA9M+PGW5GhO5u4mir0egkS
         7PnHuzqMVAUBtA22ZP7IS47ogHTs5+xqvRfN36HvjaG1GxVrBWMtc/dxfQqznzIjtfXd
         0gSM2UKw38meKtDr5IMtHfvpe+LKI6I2TO1oMlQ/jviRLwpB2CMuM0yPJ119UuliMW/d
         N8HzmwvCdCjGcb4G38Acb5TJBOELvVHKhTVHTNuWln0SuVA8ubtfVn7yO2FmVpKdmXUk
         K923bRl+2CG2RA6Vj7kPvro9fKA/w/m2Sxawz4TxI45Ihp93Ep1G9oleDw34UU4dyGTl
         ivuQ==
X-Gm-Message-State: ANhLgQ0622ylGk4vyAt+ahaSD5eO3TqMUCwBC4TIK3AaxqlHpBd2ZA5H
	xthXXb5kVJqPphvMheQR4jhUStJ2PMIIRPwQOGTOFa7k
X-Google-Smtp-Source: ADFU+vtjq/oqLBXrmtbFZvgHlKXzNpW5TT1TzlVxNDyMbzEMFz5hcrRNzSC6h45IULpPvHbC4EY5SuQQ75a4ePI3A+0=
X-Received: by 2002:a81:9bc2:: with SMTP id s185mr2631494ywg.55.1583924805698;
 Wed, 11 Mar 2020 04:06:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200311105643.159467-1-rui.silva@arm.com> <20200311105643.159467-2-rui.silva@arm.com>
In-Reply-To: <20200311105643.159467-2-rui.silva@arm.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Wed, 11 Mar 2020 12:06:34 +0100
Message-ID: <CAP71WjwuG4saWcZSvYxGxxpQ3_c2OEVhmg+AEwWGbn6wQpw4uA@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 1/3] arm-bsp: add upstream kernel inc and v5.3 recipe
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com, Rui Silva <rui.silva@arm.com>
Content-Type: multipart/alternative; boundary="000000000000651c9905a0923b41"

--000000000000651c9905a0923b41
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 11, 2020 at 11:57 AM Rui Miguel Silva <rui.silva@arm.com> wrote:

> From: Rui Silva <rui.silva@arm.com>
>
> Add support to build using the upstream (Linus tree) and as first user
> add recipe for v5.3, which will be later.
>
> Change-Id: I0f30a45002adca7c0b95a0421e0291a6852295eb
> Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
> ---
>  .../linux/linux-upstream-arm-platforms.inc    | 24 +++++++++++++++++++
>  .../linux/linux-upstream-arm_5.3.bb           |  8 +++++++
>  2 files changed, 32 insertions(+)
>  create mode 100644
> meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm-platforms.inc
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/
> linux-upstream-arm_5.3.bb
>
> diff --git
> a/meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm-platforms.inc
> b/meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm-platforms.inc
> new file mode 100644
> index 000000000000..7b73e7536d19
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm-platforms.inc
> @@ -0,0 +1,24 @@
> +DESCRIPTION = "Linux Kernel based on upstream tree"
> +SECTION = "kernel"
> +LICENSE = "GPLv2"
> +SRCREV_FORMAT = "kernel"
> +
> +require recipes-kernel/linux/linux-yocto.inc
> +
> +KERNEL_VERSION_SANITY_SKIP = "1"
> +
> +S = "${WORKDIR}/git"
> +
> +# Override do_kernel_configme to avoid kernel being assembled into a
> linux-yocto
> +# style kernel
> +#
> https://www.yoctoproject.org/docs/latest/ref-manual/ref-manual.html#ref-tasks-kernel_configme
> +do_kernel_configme[noexec] = "1"
>

What are the benefits of using linux-yocto when building an upstream
kernel? Most BSP typically define their own linux.inc file and do_configure
task. I am curious about your approach here, since I haven't seen that
before.

+
> +# Make sure no branch is defined since here we track a specific version
> +KBRANCH = ""
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
> +
> +SRC_URI = "\
> +        git://
> git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux;protocol=https;nobranch=1
> \
> +        "
> diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm_5.3.bb
> b/meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm_5.3.bb
> new file mode 100644
> index 000000000000..88a06c4bb3c0
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm_5.3.bb
> @@ -0,0 +1,8 @@
> +# Add support for Upstream Kernel for Arm Platforms (boards or simulators)
> +
> +SUMMARY = "Linux Kernel Upstream, supported by Arm/Linaro"
> +
> +require recipes-kernel/linux/linux-upstream-arm-platforms.inc
> +
> +SRCREV = "v${PV}"
> +LINUX_VERSION ?= "${PV}"
> --
> 2.25.1
>
> IMPORTANT NOTICE: The contents of this email and any attachments are
> confidential and may also be privileged. If you are not the intended
> recipient, please notify the sender immediately and do not disclose the
> contents to any other person, use it for any purpose, or store or copy the
> information in any medium. Thank you.
> 
>

--000000000000651c9905a0923b41
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 11, 2020 at 11:57 AM Rui =
Miguel Silva &lt;<a href=3D"mailto:rui.silva@arm.com">rui.silva@arm.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From=
: Rui Silva &lt;<a href=3D"mailto:rui.silva@arm.com" target=3D"_blank">rui.=
silva@arm.com</a>&gt;<br>
<br>
Add support to build using the upstream (Linus tree) and as first user<br>
add recipe for v5.3, which will be later.<br>
<br>
Change-Id: I0f30a45002adca7c0b95a0421e0291a6852295eb<br>
Signed-off-by: Rui Miguel Silva &lt;<a href=3D"mailto:rui.silva@arm.com" t=
arget=3D"_blank">rui.silva@arm.com</a>&gt;<br>
---<br>
=C2=A0.../linux/linux-upstream-arm-platforms.inc=C2=A0 =C2=A0 | 24 +++++++=
++++++++++++<br>
=C2=A0.../linux/<a href=3D"http://linux-upstream-arm_5.3.bb" rel=3D"norefe=
rrer" target=3D"_blank">linux-upstream-arm_5.3.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 8 +++++++<br>
=C2=A02 files changed, 32 insertions(+)<br>
=C2=A0create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-upstream-=
arm-platforms.inc<br>
=C2=A0create mode 100644 meta-arm-bsp/recipes-kernel/linux/<a href=3D"http=
://linux-upstream-arm_5.3.bb" rel=3D"noreferrer" target=3D"_blank">linux-up=
stream-arm_5.3.bb</a><br>
<br>
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm-platform=
s.inc b/meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm-platforms.inc<=
br>
new file mode 100644<br>
index 000000000000..7b73e7536d19<br>
--- /dev/null<br>
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm-platforms.inc<b=
r>
@@ -0,0 +1,24 @@<br>
+DESCRIPTION =3D &quot;Linux Kernel based on upstream tree&quot;<br>
+SECTION =3D &quot;kernel&quot;<br>
+LICENSE =3D &quot;GPLv2&quot;<br>
+SRCREV_FORMAT =3D &quot;kernel&quot;<br>
+<br>
+require recipes-kernel/linux/linux-yocto.inc<br>
+<br>
+KERNEL_VERSION_SANITY_SKIP =3D &quot;1&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+# Override do_kernel_configme to avoid kernel being assembled into a linu=
x-yocto<br>
+# style kernel<br>
+# <a href=3D"https://www.yoctoproject.org/docs/latest/ref-manual/ref-manu=
al.html#ref-tasks-kernel_configme" rel=3D"noreferrer" target=3D"_blank">htt=
ps://www.yoctoproject.org/docs/latest/ref-manual/ref-manual.html#ref-tasks-=
kernel_configme</a><br>
+do_kernel_configme[noexec] =3D &quot;1&quot;<br></blockquote><div><br></d=
iv><div>What are the benefits of using linux-yocto when building an upstrea=
m kernel? Most BSP typically define their own linux.inc file and do_configu=
re task. I am curious about your approach here, since I haven&#39;t seen th=
at before. <br></div><div><br></div><blockquote class=3D"gmail_quote" style=
=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
+<br>
+# Make sure no branch is defined since here we track a specific version<b=
r>
+KBRANCH =3D &quot;&quot;<br>
+<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dbbea815ee2795b2f4230826c0=
c6b8814&quot;<br>
+<br>
+SRC_URI =3D &quot;\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://git.kernel.org/pub/sc=
m/linux/kernel/git/torvalds/linux;protocol=3Dhttps;nobranch=3D1" rel=3D"nor=
eferrer" target=3D"_blank">git.kernel.org/pub/scm/linux/kernel/git/torvalds=
/linux;protocol=3Dhttps;nobranch=3D1</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
diff --git a/meta-arm-bsp/recipes-kernel/linux/<a href=3D"http://linux-ups=
tream-arm_5.3.bb" rel=3D"noreferrer" target=3D"_blank">linux-upstream-arm_5=
.3.bb</a> b/meta-arm-bsp/recipes-kernel/linux/<a href=3D"http://linux-upstr=
eam-arm_5.3.bb" rel=3D"noreferrer" target=3D"_blank">linux-upstream-arm_5.3=
.bb</a><br>
new file mode 100644<br>
index 000000000000..88a06c4bb3c0<br>
--- /dev/null<br>
+++ b/meta-arm-bsp/recipes-kernel/linux/<a href=3D"http://linux-upstream-a=
rm_5.3.bb" rel=3D"noreferrer" target=3D"_blank">linux-upstream-arm_5.3.bb</=
a><br>
@@ -0,0 +1,8 @@<br>
+# Add support for Upstream Kernel for Arm Platforms (boards or simulators=
)<br>
+<br>
+SUMMARY =3D &quot;Linux Kernel Upstream, supported by Arm/Linaro&quot;<br=
>
+<br>
+require recipes-kernel/linux/linux-upstream-arm-platforms.inc<br>
+<br>
+SRCREV =3D &quot;v${PV}&quot;<br>
+LINUX_VERSION ?=3D &quot;${PV}&quot;<br>
--<br>
2.25.1<br>
<br>
IMPORTANT NOTICE: The contents of this email and any attachments are confi=
dential and may also be privileged. If you are not the intended recipient, =
please notify the sender immediately and do not disclose the contents to an=
y other person, use it for any purpose, or store or copy the information in=
 any medium. Thank you.<br>
<br>
</blockquote></div></div>

--000000000000651c9905a0923b41--

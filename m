Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web10.1983.1600897565502269928
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 23 Sep 2020 14:46:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=V3T8mP0e;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.194, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f194.google.com with SMTP id d20so1306738qka.5
        for <meta-arm@lists.yoctoproject.org>; Wed, 23 Sep 2020 14:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=THsVto49+0/driK22HzEFgKtO5dn4hUOirGs/a6DBK8=;
        b=V3T8mP0egNtsmEa1aJC+hPk/GhhFKJr4NDoht5qm4mya/XIy2W4cFuZ+pTt7Enlqqt
         5cYw2n+KF9TQmfXjoxkg07poUjPkKJ6j6g/2dvlSbr08w5yx9meIJUNPgbdzw0IQr3TQ
         EX5kUJcpbcWXZ2NklfXabnUkeT7HghExlAL0tpYahxXdGiQz56eyxMQxWNTQuissxTRs
         In6pzgm15AiKaJLtWnTszJlkTDKN8dL2yiHE/10bD92bmCxRDPXERy/TakckAXGjhSVx
         uoKcL7XqU71m7wRG+JEKvrE9LUmP2T5s4NiTxXEZ1zspQ5nPS9DqWFRH/Vv0pbSkRY8I
         EELw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=THsVto49+0/driK22HzEFgKtO5dn4hUOirGs/a6DBK8=;
        b=Ac1rgZREPscDaQs+PQA/0to6GBOFlClZU8dKJTQn9F6TfLFN3Bk/oZOy/hb+dZ2d8S
         FLZs7RRgWCuGTVRnBoP2zI0IzonDvN0XQlJWsZ0tSyzHTzysRu4W52/TxBXOXAtpFtcv
         EFxSd7vLjdV6Mj3YMhZKnZviFPRU/sLshxK5fcSAdqhU8MCqjImF0boiGepjs45S5a/5
         /A3Afp7OgUKmzX3tF4rs5HLXrSIFHXAalLiKWNoVJzQRmZcLY33Vxoe3pw0CSbQvsW+Z
         Crjxe+BMTbxk7xw7PnrQJ+jFv+YJcF9yWcplt69QnOMUaVRfpDOX+WEsl/dv1vSUxXb2
         XJbg==
X-Gm-Message-State: AOAM533muZdOh4rd6NV+IoW2kp90+9qaA55VL/G9sFIm5oiOWDVmuU9C
	QqMNwqkOK1AFtdSrZt+CO9EjVg==
X-Google-Smtp-Source: ABdhPJwQxtnOPKidIpX0BDE3HwRtL4Ix+O2Y7Z1TuOOu99q8HjFkRYaV0Qhmr/hJoPJZi/wX1s+aFw==
X-Received: by 2002:a05:620a:15e4:: with SMTP id p4mr1882775qkm.457.1600897564399;
        Wed, 23 Sep 2020 14:46:04 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id 134sm834368qkj.53.2020.09.23.14.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2020 14:46:04 -0700 (PDT)
Date: Wed, 23 Sep 2020 17:46:01 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Usama Arif <usama.arif@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH] arm-bsp/machine: move kernel version for tc0 to 5.4
Message-ID: <20200923214601.GA22622@kudzu.us>
References: <20200923174105.54366-1-usama.arif@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200923174105.54366-1-usama.arif@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 23, 2020 at 06:41:05PM +0100, Usama Arif wrote:
> As the ack-4.19 patches are no longer used, they can
> be removed.
> 
> Change-Id: Iecbfe86107b7b142f17af6bdfbee086b9590fc1a
> Signed-off-by: Usama Arif <usama.arif@arm.com>

I'm seeing the following warning with this patch applied:

WARNING: linux-arm64-ack-5.4-r0 do_kernel_configcheck: [kernel config]: specified values did not make it into the kernel's final configuration:

    [NOTE]: 'CONFIG_ARM_SMMU' last val (y) and .config val (m) do not match
    [INFO]: CONFIG_ARM_SMMU : m ## .config: 6025 :configs///defconfig (y)
    [INFO]: raw config text:

        config ARM_SMMU
        	tristate "ARM Ltd. System MMU (SMMU) Support"
        	select IOMMU_API
        	select IOMMU_IO_PGTABLE_LPAE
        	select ARM_DMA_USE_IOMMU if ARM
        	depends on (ARM64 || ARM) && MMU && (QCOM_SCM || !QCOM_SCM) && IOMMU_SUPPORT
        	help
        	  Support for implementations of the ARM System MMU architecture
        	  versions 1 and 2.

        	  Say Y here if your SoC includes an IOMMU device implementing
        	  the ARM SMMU architecture.

        Config 'ARM_SMMU' has the following Direct dependencies (ARM_SMMU=m):
                ARM64(=y) || ARM(undefined/n) (=y) && MMU(=y) && QCOM_SCM(=m) || !QCOM_SCM(=m) (=m) && IOMMU_SUPPORT(=y)
        Parent dependencies are:
             MMU [y] IOMMU_SUPPORT [y] ARM [ARM] QCOM_SCM [m] ARM64 [y]


Can you tweak the config to address this issue and send out a v2?

Thanks,
Jon


> ---
>  meta-arm-bsp/conf/machine/tc0.conf            |   2 +-
>  .../linux/linux-arm-platforms.inc             |   5 -
>  ...m-Add-component-aware-simple-encoder.patch | 368 ------------------
>  ...-red-and-blue-colors-in-HDLCD-driver.patch |  43 --
>  .../linux/linux-arm64-ack_4.19.bbappend       |   2 -
>  5 files changed, 1 insertion(+), 419 deletions(-)
>  delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-4.19/tc0/0001-drm-Add-component-aware-simple-encoder.patch
>  delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-4.19/tc0/0002-swap-red-and-blue-colors-in-HDLCD-driver.patch
> 
> diff --git a/meta-arm-bsp/conf/machine/tc0.conf b/meta-arm-bsp/conf/machine/tc0.conf
> index 2de99cd..1eb3d87 100644
> --- a/meta-arm-bsp/conf/machine/tc0.conf
> +++ b/meta-arm-bsp/conf/machine/tc0.conf
> @@ -14,7 +14,7 @@ UBOOT_MACHINE ?= "total_compute_defconfig"
>  # Trusted firmware A v2.3
>  PREFERRED_PROVIDER_virtual/trusted-firmware-a ?= "trusted-firmware-a"
>  PREFERRED_VERSION_trusted-firmware-a ?= "2.3%"
> -PREFERRED_VERSION_linux-arm64-ack ?= "4.19"
> +PREFERRED_VERSION_linux-arm64-ack ?= "5.4"
>  
>  EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a"
>  
> diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
> index 79ef26e..ee720fd 100644
> --- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
> +++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
> @@ -76,8 +76,3 @@ COMPATIBLE_MACHINE_tc0 = "tc0"
>  KMACHINE_tc0 = "tc0"
>  KBUILD_DEFCONFIG_tc0 = "defconfig"
>  KCONFIG_MODE_tc0 = "--alldefconfig"
> -SRC_URI_append_tc0 = " \
> -    file://0001-drm-Add-component-aware-simple-encoder.patch \
> -    file://0002-swap-red-and-blue-colors-in-HDLCD-driver.patch \
> -    file://defconfig \
> -    "
> diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-4.19/tc0/0001-drm-Add-component-aware-simple-encoder.patch b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-4.19/tc0/0001-drm-Add-component-aware-simple-encoder.patch
> deleted file mode 100644
> index 96cc651..0000000
> --- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-4.19/tc0/0001-drm-Add-component-aware-simple-encoder.patch
> +++ /dev/null
> @@ -1,368 +0,0 @@
> -From 6fd66138c44107786879d0adebe78ca94cf6292f Mon Sep 17 00:00:00 2001
> -From: Liviu Dudau <Liviu.Dudau@arm.com>
> -Date: Wed, 1 Apr 2020 12:10:14 +0100
> -Subject: [PATCH 1/2] drm: Add component-aware simple encoder
> -
> -This is a simple DRM encoder that gets its connector timings information
> -from a OF subnode in the device tree and exposes that as a "discovered"
> -panel. It can be used together with component-based DRM drivers in an
> -emulated environment where no real encoder or connector hardware exists
> -and the display output is configured outside the kernel.
> -
> -Signed-off-by: Liviu Dudau <Liviu.Dudau@arm.com>
> -[Backported to gem5's 4.3 kernel]
> -Signed-off-by: Andreas Sandberg <andreas.sandberg@arm.com>
> -[Ported to gem5's 4.9 kernel. Added dep. on VIDEOMODE_HELPERS.]
> -Signed-off-by: Andreas Sandberg <andreas.sandberg@arm.com>
> -[Ported to gem5's 4.14 kernel.]
> -Signed-off-by: Andreas Sandberg <andreas.sandberg@arm.com>
> -Upstream-Status: Backport
> -Signed-off-by: Teo Couprie Diaz <teo.coupriediaz@arm.com>
> ----
> - drivers/gpu/drm/Kconfig               |  10 ++
> - drivers/gpu/drm/Makefile              |   3 +
> - drivers/gpu/drm/drm_virtual_encoder.c | 297 ++++++++++++++++++++++++++++++++++
> - 3 files changed, 310 insertions(+)
> - create mode 100644 drivers/gpu/drm/drm_virtual_encoder.c
> -
> -diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> -index e44e567..6e95357 100644
> ---- a/drivers/gpu/drm/Kconfig
> -+++ b/drivers/gpu/drm/Kconfig
> -@@ -255,6 +255,16 @@ config DRM_VKMS
> - 
> - 	  If M is selected the module will be called vkms.
> - 
> -+config DRM_VIRT_ENCODER
> -+	tristate "Virtual OF-based encoder"
> -+	depends on DRM && OF
> -+	select VIDEOMODE_HELPERS
> -+	help
> -+	  Choose this option to get a virtual encoder and its associated
> -+	  connector that will use the device tree to read the display
> -+	  timings information. If M is selected the module will be called
> -+	  drm_vencoder.
> -+
> - source "drivers/gpu/drm/exynos/Kconfig"
> - 
> - source "drivers/gpu/drm/rockchip/Kconfig"
> -diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> -index a6771ce..733ad62 100644
> ---- a/drivers/gpu/drm/Makefile
> -+++ b/drivers/gpu/drm/Makefile
> -@@ -46,6 +46,9 @@ drm_kms_helper-$(CONFIG_DRM_DP_CEC) += drm_dp_cec.o
> - obj-$(CONFIG_DRM_KMS_HELPER) += drm_kms_helper.o
> - obj-$(CONFIG_DRM_DEBUG_SELFTEST) += selftests/
> - 
> -+drm_vencoder-y := drm_virtual_encoder.o
> -+obj-$(CONFIG_DRM_VIRT_ENCODER) += drm_vencoder.o
> -+
> - obj-$(CONFIG_DRM)	+= drm.o
> - obj-$(CONFIG_DRM_MIPI_DSI) += drm_mipi_dsi.o
> - obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) += drm_panel_orientation_quirks.o
> -diff --git a/drivers/gpu/drm/drm_virtual_encoder.c b/drivers/gpu/drm/drm_virtual_encoder.c
> -new file mode 100644
> -index 00000000..2e2c51d
> ---- /dev/null
> -+++ b/drivers/gpu/drm/drm_virtual_encoder.c
> -@@ -0,0 +1,297 @@
> -+/*
> -+ * Copyright (C) 2016 ARM Limited
> -+ * Author: Liviu Dudau <Liviu.Dudau@arm.com>
> -+ *
> -+ * Dummy encoder and connector that use the OF to "discover" the attached
> -+ * display timings. Can be used in situations where the encoder and connector's
> -+ * functionality are emulated and no setup steps are needed, or to describe
> -+ * attached panels for which no driver exists but can be used without
> -+ * additional hardware setup.
> -+ *
> -+ * The encoder also uses the component framework so that it can be a quick
> -+ * replacement for existing drivers when testing in an emulated environment.
> -+ *
> -+ * This file is subject to the terms and conditions of the GNU General Public
> -+ * License.  See the file COPYING in the main directory of this archive
> -+ * for more details.
> -+ *
> -+ */
> -+
> -+#include <drm/drmP.h>
> -+#include <drm/drm_crtc.h>
> -+#include <drm/drm_atomic_helper.h>
> -+#include <drm/drm_crtc_helper.h>
> -+#include <drm/drm_of.h>
> -+#include <linux/component.h>
> -+#include <video/display_timing.h>
> -+#include <video/of_display_timing.h>
> -+#include <video/videomode.h>
> -+
> -+struct drm_virt_priv {
> -+	struct drm_connector connector;
> -+	struct drm_encoder encoder;
> -+	struct display_timings *timings;
> -+};
> -+
> -+#define connector_to_drm_virt_priv(x) \
> -+	container_of(x, struct drm_virt_priv, connector)
> -+
> -+#define encoder_to_drm_virt_priv(x) \
> -+	container_of(x, struct drm_virt_priv, encoder)
> -+
> -+static void drm_virtcon_destroy(struct drm_connector *connector)
> -+{
> -+	struct drm_virt_priv *conn = connector_to_drm_virt_priv(connector);
> -+
> -+	drm_connector_cleanup(connector);
> -+	display_timings_release(conn->timings);
> -+}
> -+
> -+static enum drm_connector_status
> -+drm_virtcon_detect(struct drm_connector *connector, bool force)
> -+{
> -+	return connector_status_connected;
> -+}
> -+
> -+static const struct drm_connector_funcs drm_virtcon_funcs = {
> -+	.reset = drm_atomic_helper_connector_reset,
> -+	.detect	= drm_virtcon_detect,
> -+	.fill_modes = drm_helper_probe_single_connector_modes,
> -+	.destroy = drm_virtcon_destroy,
> -+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> -+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> -+};
> -+
> -+static int drm_virtcon_get_modes(struct drm_connector *connector)
> -+{
> -+	struct drm_virt_priv *conn = connector_to_drm_virt_priv(connector);
> -+	struct display_timings *timings = conn->timings;
> -+	int i;
> -+
> -+	for (i = 0; i < timings->num_timings; i++) {
> -+		struct drm_display_mode *mode = drm_mode_create(connector->dev);
> -+		struct videomode vm;
> -+
> -+		if (videomode_from_timings(timings, &vm, i))
> -+			break;
> -+
> -+		drm_display_mode_from_videomode(&vm, mode);
> -+		mode->type = DRM_MODE_TYPE_DRIVER;
> -+		if (timings->native_mode == i)
> -+			mode->type = DRM_MODE_TYPE_PREFERRED;
> -+
> -+		drm_mode_set_name(mode);
> -+		drm_mode_probed_add(connector, mode);
> -+	}
> -+
> -+	return i;
> -+}
> -+
> -+static int drm_virtcon_mode_valid(struct drm_connector *connector,
> -+				   struct drm_display_mode *mode)
> -+{
> -+	return MODE_OK;
> -+}
> -+
> -+struct drm_encoder *drm_virtcon_best_encoder(struct drm_connector *connector)
> -+{
> -+	struct drm_virt_priv *priv = connector_to_drm_virt_priv(connector);
> -+
> -+	return &priv->encoder;
> -+}
> -+
> -+struct drm_encoder *
> -+drm_virtcon_atomic_best_encoder(struct drm_connector *connector,
> -+				 struct drm_connector_state *connector_state)
> -+{
> -+	struct drm_virt_priv *priv = connector_to_drm_virt_priv(connector);
> -+
> -+	return &priv->encoder;
> -+}
> -+
> -+static const struct drm_connector_helper_funcs drm_virtcon_helper_funcs = {
> -+	.get_modes = drm_virtcon_get_modes,
> -+	.mode_valid = drm_virtcon_mode_valid,
> -+	.best_encoder = drm_virtcon_best_encoder,
> -+	.atomic_best_encoder = drm_virtcon_atomic_best_encoder,
> -+};
> -+
> -+static void drm_vencoder_destroy(struct drm_encoder *encoder)
> -+{
> -+	drm_encoder_cleanup(encoder);
> -+}
> -+
> -+static const struct drm_encoder_funcs drm_vencoder_funcs = {
> -+	.destroy = drm_vencoder_destroy,
> -+};
> -+
> -+static void drm_vencoder_dpms(struct drm_encoder *encoder, int mode)
> -+{
> -+	/* nothing needed */
> -+}
> -+
> -+static bool drm_vencoder_mode_fixup(struct drm_encoder *encoder,
> -+				    const struct drm_display_mode *mode,
> -+				    struct drm_display_mode *adjusted_mode)
> -+{
> -+	/* nothing needed */
> -+	return true;
> -+}
> -+
> -+static void drm_vencoder_prepare(struct drm_encoder *encoder)
> -+{
> -+	drm_vencoder_dpms(encoder, DRM_MODE_DPMS_OFF);
> -+}
> -+
> -+static void drm_vencoder_commit(struct drm_encoder *encoder)
> -+{
> -+	drm_vencoder_dpms(encoder, DRM_MODE_DPMS_ON);
> -+}
> -+
> -+static void drm_vencoder_mode_set(struct drm_encoder *encoder,
> -+				  struct drm_display_mode *mode,
> -+				  struct drm_display_mode *adjusted_mode)
> -+{
> -+	/* nothing needed */
> -+}
> -+
> -+static const struct drm_encoder_helper_funcs drm_vencoder_helper_funcs = {
> -+	.dpms		= drm_vencoder_dpms,
> -+	.mode_fixup	= drm_vencoder_mode_fixup,
> -+	.prepare	= drm_vencoder_prepare,
> -+	.commit		= drm_vencoder_commit,
> -+	.mode_set	= drm_vencoder_mode_set,
> -+};
> -+
> -+static int drm_vencoder_bind(struct device *dev, struct device *master,
> -+			     void *data)
> -+{
> -+	struct drm_encoder *encoder;
> -+	struct drm_virt_priv *con;
> -+	struct drm_connector *connector;
> -+	struct drm_device *drm = data;
> -+	u32 crtcs = 0;
> -+	int ret;
> -+
> -+	con = devm_kzalloc(dev, sizeof(*con), GFP_KERNEL);
> -+	if (!con)
> -+		return -ENOMEM;
> -+
> -+	dev_set_drvdata(dev, con);
> -+	connector = &con->connector;
> -+	encoder = &con->encoder;
> -+
> -+	if (dev->of_node) {
> -+		struct drm_bridge *bridge;
> -+		crtcs = drm_of_find_possible_crtcs(drm, dev->of_node);
> -+		bridge = of_drm_find_bridge(dev->of_node);
> -+		if (bridge) {
> -+			ret = drm_bridge_attach(encoder, bridge, NULL);
> -+			if (ret) {
> -+				DRM_ERROR("Failed to initialize bridge\n");
> -+				return ret;
> -+			}
> -+		}
> -+		con->timings = of_get_display_timings(dev->of_node);
> -+		if (!con->timings) {
> -+			dev_err(dev, "failed to get display panel timings\n");
> -+			return ENXIO;
> -+		}
> -+	}
> -+
> -+	/* If no CRTCs were found, fall back to the old encoder's behaviour */
> -+	if (crtcs == 0) {
> -+		dev_warn(dev, "Falling back to first CRTC\n");
> -+		crtcs = 1 << 0;
> -+	}
> -+
> -+	encoder->possible_crtcs = crtcs ? crtcs : 1;
> -+	encoder->possible_clones = 0;
> -+
> -+	ret = drm_encoder_init(drm, encoder, &drm_vencoder_funcs,
> -+			       DRM_MODE_ENCODER_VIRTUAL, NULL);
> -+	if (ret)
> -+		goto encoder_init_err;
> -+
> -+	drm_encoder_helper_add(encoder, &drm_vencoder_helper_funcs);
> -+
> -+	/* bogus values, pretend we're a 24" screen for DPI calculations */
> -+	connector->display_info.width_mm = 519;
> -+	connector->display_info.height_mm = 324;
> -+	connector->interlace_allowed = false;
> -+	connector->doublescan_allowed = false;
> -+	connector->polled = 0;
> -+
> -+	ret = drm_connector_init(drm, connector, &drm_virtcon_funcs,
> -+				 DRM_MODE_CONNECTOR_VIRTUAL);
> -+	if (ret)
> -+		goto connector_init_err;
> -+
> -+	drm_connector_helper_add(connector, &drm_virtcon_helper_funcs);
> -+
> -+	drm_connector_register(connector);
> -+
> -+	ret = drm_connector_attach_encoder(connector, encoder);
> -+	if (ret)
> -+		goto attach_err;
> -+
> -+	return ret;
> -+
> -+attach_err:
> -+	drm_connector_unregister(connector);
> -+	drm_connector_cleanup(connector);
> -+connector_init_err:
> -+	drm_encoder_cleanup(encoder);
> -+encoder_init_err:
> -+	display_timings_release(con->timings);
> -+
> -+	return ret;
> -+};
> -+
> -+static void drm_vencoder_unbind(struct device *dev, struct device *master,
> -+				void *data)
> -+{
> -+	struct drm_virt_priv *con = dev_get_drvdata(dev);
> -+
> -+	drm_connector_unregister(&con->connector);
> -+	drm_connector_cleanup(&con->connector);
> -+	drm_encoder_cleanup(&con->encoder);
> -+	display_timings_release(con->timings);
> -+}
> -+
> -+static const struct component_ops drm_vencoder_ops = {
> -+	.bind = drm_vencoder_bind,
> -+	.unbind = drm_vencoder_unbind,
> -+};
> -+
> -+static int drm_vencoder_probe(struct platform_device *pdev)
> -+{
> -+	return component_add(&pdev->dev, &drm_vencoder_ops);
> -+}
> -+
> -+static int drm_vencoder_remove(struct platform_device *pdev)
> -+{
> -+	component_del(&pdev->dev, &drm_vencoder_ops);
> -+	return 0;
> -+}
> -+
> -+static const struct of_device_id drm_vencoder_of_match[] = {
> -+	{ .compatible = "drm,virtual-encoder", },
> -+	{},
> -+};
> -+MODULE_DEVICE_TABLE(of, drm_vencoder_of_match);
> -+
> -+static struct platform_driver drm_vencoder_driver = {
> -+	.probe = drm_vencoder_probe,
> -+	.remove = drm_vencoder_remove,
> -+	.driver = {
> -+		.name = "drm_vencoder",
> -+		.of_match_table = drm_vencoder_of_match,
> -+	},
> -+};
> -+
> -+module_platform_driver(drm_vencoder_driver);
> -+
> -+MODULE_AUTHOR("Liviu Dudau");
> -+MODULE_DESCRIPTION("Virtual DRM Encoder");
> -+MODULE_LICENSE("GPL v2");
> --- 
> -2.7.4
> -
> diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-4.19/tc0/0002-swap-red-and-blue-colors-in-HDLCD-driver.patch b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-4.19/tc0/0002-swap-red-and-blue-colors-in-HDLCD-driver.patch
> deleted file mode 100644
> index 621209f..0000000
> --- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-4.19/tc0/0002-swap-red-and-blue-colors-in-HDLCD-driver.patch
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -From 064807d22a0a2865a930d4cc48b61f917f4bf15f Mon Sep 17 00:00:00 2001
> -From: Anders Dellien <anders.dellien@arm.com>
> -Date: Fri, 17 Apr 2020 16:06:03 +0100
> -Subject: [PATCH 2/2] swap red and blue colors in HDLCD driver
> -
> -The HDLCD drivers is configured to use BGR888 but Android needs
> -RGB888 - so we need to swap the red and blue components.
> -
> -Change-Id: Ib47ddff9280a53757925f6c1b1f373089d038025
> -Signed-off-by: Anders Dellien<anders.dellien@arm.com>
> -Upstream-Status: Inappropriate [Color swap needed for TC0 only]
> -Signed-off-by: Teo Couprie Diaz <teo.coupriediaz@arm.com>
> ----
> - drivers/gpu/drm/arm/hdlcd_crtc.c | 8 ++++----
> - 1 file changed, 4 insertions(+), 4 deletions(-)
> -
> -diff --git a/drivers/gpu/drm/arm/hdlcd_crtc.c b/drivers/gpu/drm/arm/hdlcd_crtc.c
> -index e69d996..a46ba4f 100644
> ---- a/drivers/gpu/drm/arm/hdlcd_crtc.c
> -+++ b/drivers/gpu/drm/arm/hdlcd_crtc.c
> -@@ -110,15 +110,15 @@ static int hdlcd_set_pxl_fmt(struct drm_crtc *crtc)
> - 	 * pixel is outside the visible frame area or when there is a
> - 	 * buffer underrun.
> - 	 */
> --	hdlcd_write(hdlcd, HDLCD_REG_RED_SELECT, format->red.offset |
> -+	hdlcd_write(hdlcd, HDLCD_REG_RED_SELECT, format->blue.offset |
> - #ifdef CONFIG_DRM_HDLCD_SHOW_UNDERRUN
> - 		    0x00ff0000 |	/* show underruns in red */
> - #endif
> --		    ((format->red.length & 0xf) << 8));
> -+		    ((format->blue.length & 0xf) << 8));
> - 	hdlcd_write(hdlcd, HDLCD_REG_GREEN_SELECT, format->green.offset |
> - 		    ((format->green.length & 0xf) << 8));
> --	hdlcd_write(hdlcd, HDLCD_REG_BLUE_SELECT, format->blue.offset |
> --		    ((format->blue.length & 0xf) << 8));
> -+	hdlcd_write(hdlcd, HDLCD_REG_BLUE_SELECT, format->red.offset |
> -+		    ((format->red.length & 0xf) << 8));
> - 
> - 	return 0;
> - }
> --- 
> -2.7.4
> -
> diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack_4.19.bbappend b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack_4.19.bbappend
> index 4b1aaa0..f765661 100644
> --- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack_4.19.bbappend
> +++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack_4.19.bbappend
> @@ -1,5 +1,3 @@
>  # Machine specific configurations
>  
> -FILESEXTRAPATHS_prepend := "${THISDIR}/linux-arm64-ack-4.19:${THISDIR}/files:"
> -
>  require linux-arm-platforms.inc
> -- 
> 2.17.1
> 

> 
> 
> 

